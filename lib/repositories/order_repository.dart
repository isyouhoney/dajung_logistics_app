import 'dart:convert';
import 'package:bakery_app/models/item.dart';
import 'package:bakery_app/models/order_item.dart';
import 'package:bakery_app/models/order_sheet.dart';
import 'package:bakery_app/utils/configs.dart';
import 'package:bakery_app/utils/enums.dart';
import 'package:bakery_app/utils/secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class OrderRepository extends GetxController {

  Future<List<OrderSheet>?> getOrderSheets() async {
    final Uri url = Uri.parse('$baseUrl/order');
    String? accessToken = await SecureStorage.get(Cached.ACCESS);

    if (accessToken == null) {
      logger.e('액세스 토큰이 없습니다.');
      return null;
    }

    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
    );

    var responseBody = jsonDecode(response.body);
    var bodyStatusCode = responseBody['statusCode'];

    if (bodyStatusCode == 200) {
      dynamic data = responseBody['data'];
      List<OrderSheet> orderSheets = [];
      List<OrderItem> orderItems = [];

      if(data.isNotEmpty) {
        data.map((orderSheet) {
          String dayOfTheWeek = orderSheet['dayOfTheWeek'];
          List orderItemList = orderSheet['orderItems'];
          orderItemList.map((orderItem){
            orderItems.add(OrderItem(item:Item.fromJson(orderItem), quantity: orderItem['quantity']));
          }).toList();
          orderSheets.add(OrderSheet(dayOfTheWeek: DayOfWeek.fromKor(dayOfTheWeek)!, orderItems: orderItems));
        }).toList();

      }
      return orderSheets;
    } else {
      logger.e('주문서 조회 요청 실패: $responseBody');
    }
  }

  Future<List<OrderItem>?> getDayOrders(DayOfWeek dayOfWeek) async {
    String dayOfTheWeek = dayOfWeek.kor;
      final Uri url = Uri.parse('$baseUrl/order/sub');
      String? accessToken = await SecureStorage.get(Cached.ACCESS);

      if (accessToken == null) {
        logger.e('액세스 토큰이 없습니다.');
        return null;
      }

      final response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
      );

      var responseBody = jsonDecode(response.body);
      var bodyStatusCode = responseBody['statusCode'];

      if (bodyStatusCode == 200) {
        dynamic data = responseBody['data'];
        List<OrderItem> orderItemList = [];
        if(data.isNotEmpty) {
          data[0]['orderItems'].map((orderItem) {
            Item i = Item.fromJson(orderItem);
            OrderItem o = OrderItem(item: i, quantity: orderItem['quantity']);
            orderItemList.add(o);
          }).toList();
        }
        return orderItemList;
      } else {
        logger.e('요일별 주문서 조회 요청 실패: $responseBody');
      }
    }

  Future<List?> getDayTotalOrders() async {
    String dayOfTheWeek = DateFormat('E', 'ko_KR').format(DateTime.now());
    final Uri url = Uri.parse('$baseUrl/order/sub-total?dayOfTheWeek=$dayOfTheWeek');
    String? accessToken = await SecureStorage.get(Cached.ACCESS);

    if (accessToken == null) {
      logger.e('액세스 토큰이 없습니다.');
      return null;
    }

    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
    );

    var responseBody = jsonDecode(response.body);
    var bodyStatusCode = responseBody['statusCode'];

    if (bodyStatusCode == 200) {
      List<dynamic> data = responseBody['data'];
      return data;
    } else {
      logger.e('요일별 주문량 조회 요청 실패: $responseBody');
    }
  }

  Future<bool?> postOrder(DayOfWeek dayOfWeek, List<OrderItem> orderItems) async {
    final Uri url = Uri.parse('$baseUrl/order');
    String? accessToken = await SecureStorage.get(Cached.ACCESS);

    if (accessToken == null) {
      logger.e('액세스 토큰이 없습니다.');
      return false;
    }

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode({
          'orderSheets':[{
        'dayOfTheWeek' : dayOfWeek.kor,
        'orderItems' : orderItems
      }]}),
    );

    var responseBody = jsonDecode(response.body);
    var bodyStatusCode = responseBody['statusCode'];

    if (bodyStatusCode == 200) {
      return true;
    } else {
      logger.e('제품 등록 요청 실패: $responseBody');
      return false;
    }
  }
}
