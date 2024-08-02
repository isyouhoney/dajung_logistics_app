import 'dart:convert';
import 'package:bakery_app/models/additional_request.dart';
import 'package:bakery_app/models/item.dart';
import 'package:bakery_app/models/order_item.dart';
import 'package:bakery_app/models/user.dart';
import 'package:bakery_app/utils/configs.dart';
import 'package:bakery_app/utils/enums.dart';
import 'package:bakery_app/utils/secure_storage.dart';
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
      print(data);
      List<AdditionalRequest> additionalRequests = [];

      if(data.isNotEmpty) {
        data.map((orderSheet) {
          OrderItem orderItem = OrderItem(item:Item.fromJson(data), quantity: data['quantity']);
          String requestDate = data['requestDate'];
          String status = data['status'];
          User accept = User.fromJson(data['accept']);

          additionalRequests.add(AdditionalRequest(orderItem: orderItem, requestDate: requestDate, status: status, accept: accept));
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
}
