import 'dart:convert';
import 'package:bakery_app/models/item.dart';
import 'package:bakery_app/models/product.dart';
import 'package:bakery_app/utils/configs.dart';
import 'package:bakery_app/utils/secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class ProductionRepository extends GetxController {
  Future<List?> getProductions(startDate, endDate) async {
    final Uri url = Uri.parse('$baseUrl/production?productionDateStartDate=$startDate&productionDateEndDate=$endDate');
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
      List data = responseBody['data'];
      return data;
    } else {
      logger.e('생산 기록 조회 요청 실패: ${response.statusCode}');
    }
  }

  Future<bool?> postProduction(List<Product> products, String postDate) async {
    final Uri url = Uri.parse('$baseUrl/production');
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
        'productionDate' : postDate,
        'products' : products,
      }),
    );

    var responseBody = jsonDecode(response.body);
    var bodyStatusCode = responseBody['statusCode'];
    print(responseBody);

    if (bodyStatusCode == 200) {
      return true;
    } else {
      logger.e('일일 생산량 등록 요청 실패: ${response.statusCode}');
      return false;
    }
  }
}
