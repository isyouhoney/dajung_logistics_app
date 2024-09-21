import 'dart:convert';
import 'package:bakery_app/models/product.dart';
import 'package:bakery_app/utils/configs.dart';
import 'package:bakery_app/utils/secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class ProductionRepository extends GetxController {
  Future<List?> getProductions(startDate, endDate) async {
    final Uri url = Uri.parse('$baseUrl/production/history?productionDateStartDate=$startDate&productionDateEndDate=$endDate');
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
    print('getProductions : ${responseBody}');

    if (bodyStatusCode == 200) {
      List data = responseBody['data'];
      return data;
    } else {
      logger.e('생산 기록 조회 요청 실패: ${response.statusCode}');
    }
  }

  Future<Map?> getTodayProductions() async {
    String date = DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(days: 2))).toString();
    final Uri url = Uri.parse('$baseUrl/production?date=$date');
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
    print('getTodayProductions : ${responseBody}');

    if (bodyStatusCode == 200) {
      if(responseBody['data'] != null){
        Map data = responseBody['data'];
        return data;
      }
    } else {
      logger.e('생산 기록 조회 요청 실패: ${response.statusCode}');
    }
  }

  Future<bool?> postProduction(List<Product> products) async {
    String postDate = DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(days: 2))).toString();
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

  Future<bool?> editProduction(int id, List<Product> products) async {
    String postDate = DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(days: 2))).toString();
    final Uri url = Uri.parse('$baseUrl/production/edit');
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
        'id' : id,
        'productionDate' : postDate,
        'products' : products,
      }),
    );

    var responseBody = jsonDecode(response.body);
    var bodyStatusCode = responseBody['statusCode'];
    print('edit : ${responseBody}');

    if (bodyStatusCode == 200) {
      return true;
    } else {
      logger.e('일일 생산량 수정 요청 실패: ${response.statusCode}');
      return false;
    }
  }

  Future<List?> getProductionHistory(DateTime startDate, DateTime endDate, {int? itemCategoryId, int? itemId}) async {
    String productionDateStartDate = DateFormat('yyyy-MM-dd').format(startDate);
    String productionDateEndDate = DateFormat('yyyy-MM-dd').format(endDate);
    final Uri url = Uri.parse('$baseUrl/production/history?productionDateStartDate=$productionDateStartDate&productionDateEndDate=$productionDateEndDate');
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
    print('getProductions : ${responseBody}');

    if (bodyStatusCode == 200) {
      List data = responseBody['data'];
      return data;
    } else {
      logger.e('생산 기록 조회 요청 실패: ${response.statusCode}');
    }
  }
}
