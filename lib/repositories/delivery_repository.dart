import 'dart:convert';
import 'package:bakery_app/models/order.dart';
import 'package:bakery_app/models/order_item.dart';
import 'package:bakery_app/models/order_sheet.dart';
import 'package:bakery_app/utils/configs.dart';
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
      List<OrderItem>? recallItems = data['yesterdayOrder'] == null ? []:data['yesterdayOrder']['recallItems'].map<OrderItem>((e) => OrderItem.fromJson(e)).toList();
      // List<OrderItem>? orderItems = data['todayOrder']['orderSheet']['orderItems'].map<OrderItem>((e) => OrderItem.fromJson(e)).toList();
      print(data['todayOrder']);
      // print(data['todayOrder']['orderSheet']);
      Order orderData = Order(orderSheet: OrderSheet.fromJson(data['todayOrder']['orderSheet']), orderDate: data['orderDate'], status: data['status'], recall: recallItems);
      return orderData;
    } else {
      logger.e('주문 내역 조회 요청 실패: $responseBody');
    }
  }
}