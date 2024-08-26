import 'dart:convert';
import 'package:bakery_app/models/additional_request.dart';
import 'package:bakery_app/models/item.dart';
import 'package:bakery_app/models/order_item.dart';
import 'package:bakery_app/models/user.dart';
import 'package:bakery_app/utils/configs.dart';
import 'package:bakery_app/utils/enums.dart';
import 'package:bakery_app/utils/secure_storage.dart';
import 'package:bakery_app/viewmodels/auth_service.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class RequestRepository extends GetxController {

  Future<List<AdditionalRequest>?> getRequest(RequestedBy requestedBy) async {
    String requestBy = requestedBy.kor;
    final Uri url = Uri.parse('$baseUrl/additional-request?requestedBy=$requestBy');
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
      List<AdditionalRequest> additionalRequests = [];

      if(data.isNotEmpty) {
        data.map((orderSheet) {
          OrderItem orderItem = OrderItem(item:Item.fromJson(orderSheet), quantity: orderSheet['quantity']);
          String requestDate = orderSheet['requestDate'];
          String status = orderSheet['status'];
          int id = orderSheet['id'];
          additionalRequests.add(AdditionalRequest(id : id, orderItem: orderItem, requestDate: requestDate, status: status, request: requestedBy == RequestedBy.byMe ? AuthService.to.user:null));
        }).toList();
      }

      return additionalRequests;
    } else {
      logger.e('주문서 조회 요청 실패: $responseBody');
    }
  }

  Future<bool?> postRequest(OrderItem orderItem) async {
    final Uri url = Uri.parse('$baseUrl/additional-request');
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
        'quantity':orderItem.quantity,
        'requestDate':DateFormat('yyyy-MM-dd').format(DateTime.now()),
        'item':orderItem.item,
      }),
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

  Future<bool?> acceptRequest(int id) async {
    final Uri url = Uri.parse('$baseUrl/additional-request/accept');
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
        'id':id,
      }),
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

  Future<bool?> cancelRequest(int id) async {
    final Uri url = Uri.parse('$baseUrl/additional-request/cancel');
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
        'id':id,
      }),
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
}
