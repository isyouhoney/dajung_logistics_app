import 'dart:convert';
import 'package:bakery_app/models/order.dart';
import 'package:bakery_app/models/order_item.dart';
import 'package:bakery_app/models/order_sheet.dart';
import 'package:bakery_app/models/recall.dart';
import 'package:bakery_app/models/user.dart';
import 'package:bakery_app/utils/configs.dart';
import 'package:bakery_app/utils/enums.dart';
import 'package:bakery_app/utils/secure_storage.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

class DeliveryRepository extends GetxController {

  // SUB, DIRECT
  Future<List?> getDeliveryHistory(int skip, int take) async {
    final Uri url = Uri.parse('$baseUrl/order/delivery/history?skip=$skip&take=$take');
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

  // SUB, DIRECT
  Future<Order?> getDeliveryDetail(DateTime today,DateTime yesterday) async {
    final Uri url = Uri.parse('$baseUrl/order/delivery/detail?today=$today&yesterday=$yesterday');
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
      Map data = responseBody['data'];
      print(data);
      Order orderData = data['yesterdayOrder'] != null ? data['yesterdayOrder']['recall'] != null ?
        Order(orderSheet: OrderSheet.fromJson(data['todayOrder']['orderSheet']), orderDate: data['todayOrder']['orderDate'], status: data['todayOrder']['status'], recall: Recall.fromJson(data['yesterdayOrder']['recall'])):
        Order(orderSheet: OrderSheet.fromJson(data['todayOrder']['orderSheet']), orderDate: data['todayOrder']['orderDate'], status: data['todayOrder']['status']):
        Order(orderSheet: OrderSheet.fromJson(data['todayOrder']['orderSheet']), orderDate: data['todayOrder']['orderDate'], status: data['todayOrder']['status']);
      return orderData;
    } else {
      logger.e('주문 내역 조회 요청 실패: $responseBody');
    }
  }

  // SUB, DIRECT
  Future<bool> checkDelivery(String today,String yesterday) async {
    final Uri url = Uri.parse('$baseUrl/order/delivery');
    String? accessToken = await SecureStorage.get(Cached.ACCESS);

    if (accessToken == null) {
      logger.e('액세스 토큰이 없습니다.');
      return false;
    }

    final response = await http.patch(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode({
        'today' : today,
        'yesterday' : yesterday,
      }),
    );

    var responseBody = jsonDecode(response.body);
    var bodyStatusCode = responseBody['statusCode'];
    print(responseBody);

    if (bodyStatusCode == 200) {
      return true;
    } else {
      logger.e('매장 배송 확인 요청 실패: $responseBody');
      return false;
    }
  }

  // Delivery
  Future<bool> postDelivery(User store, List<String> images, Recall recall) async {
    final Uri url = Uri.parse('$baseUrl/order/delivery');
    String? accessToken = await SecureStorage.get(Cached.ACCESS);

    if (accessToken == null) {
      logger.e('액세스 토큰이 없습니다.');
      return false;
    }

    store = store.copyWith(role: store.role.kor);

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode({
        'store' : store.toJson(),
        'deliveryImages' : images,
        'recall' : recall.toJson(),
      }),
    );

    print(store.toJson());
    print(images);
    print(recall.toJson());
    var responseBody = jsonDecode(response.body);
    var bodyStatusCode = responseBody['statusCode'];
    print(responseBody);

    if (bodyStatusCode == 200) {
      return true;
    } else {
      logger.e('배송원 배송 확인 요청 실패: $responseBody');
      return false;
    }
  }

  // MAIN, DELIVER
  Future<List?> getDayOrders(DayOfWeek dayOfWeek) async {
    String dayOfTheWeek = dayOfWeek.kor;
    final Uri url = Uri.parse('$baseUrl/order/sub?dayOfTheWeek=$dayOfTheWeek');
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
    print(responseBody);

    if (bodyStatusCode == 200) {
      dynamic data = responseBody['data'];
      List orderItemList = [];
        orderItemList = data.map((value) => OrderSheet.fromJson(value)).toList();
      return orderItemList;
    } else {
      logger.e('요일별 주문서 조회 요청 실패: $responseBody');
    }
  }
}