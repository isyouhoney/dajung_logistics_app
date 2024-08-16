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

  // SUB, DIRECT
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
    // print(responseBody);

    if (bodyStatusCode == 200) {
      dynamic data = responseBody['data'];
      List<OrderSheet> orderSheets = [];
      List<OrderItem> orderItemList = [];

      if(data.isNotEmpty) {
        data.forEach((orderSheet) {
          String dayOfTheWeek = orderSheet['dayOfTheWeek'];
          orderSheet['orderItems'].forEach((orderItem){
            orderItemList.add(OrderItem(item:Item.fromJson(orderItem['item']), quantity: orderItem['quantity']));
          });
          orderSheets.add(OrderSheet(dayOfTheWeek: DayOfWeek.fromKor(dayOfTheWeek)!, orderItems: orderItemList, id: orderSheet['id']));
          orderItemList=[];
        });
      }
      return orderSheets;
    } else {
      logger.e('주문서 조회 요청 실패: $responseBody');
    }
  }
  // MAIN
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

  // SUB, DIRECT
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

  // SUB, DIRECT
  Future<bool?> editOrder(DayOfWeek dayOfWeek, List<OrderItem> orderItems, int orderSheetId) async {
    final Uri url = Uri.parse('$baseUrl/order/edit');
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
        'id' : orderSheetId,
        'dayOfTheWeek' : dayOfWeek.kor,
        'orderItems' : orderItems
      }]}),
    );

    var responseBody = jsonDecode(response.body);
    var bodyStatusCode = responseBody['statusCode'];
    print(responseBody);

    if (bodyStatusCode == 200) {
      return true;
    } else {
      logger.e('제품 등록 요청 실패: $responseBody');
      return false;
    }
  }

  // SUB, DIRECT
  Future<List?> getOrderHistory(DateTime startDate,DateTime endDate) async {
    String orderStartDate = DateFormat('yyyy-MM-dd').format(startDate);
    String orderEndDate = DateFormat('yyyy-MM-dd').format(endDate);
    final Uri url = Uri.parse('$baseUrl/order/history?orderStartDate=$orderStartDate&orderEndDate=$orderEndDate');
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
      List data = responseBody['data'];
      return data;
    } else {
      logger.e('주문 내역 조회 요청 실패: $responseBody');
    }
  }
}
