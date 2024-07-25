import 'dart:convert';
import 'package:bakery_app/utils/configs.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SearchPlaceRepository extends GetxController {

  Future<List<dynamic>?> getPlaceByName(String query) async {
    String? kakaoApiKey = dotenv.env['DAJUNG_KAKAO_RESTAPI_KEY'];
    final String url = 'https://dapi.kakao.com/v2/local/search/keyword.json?query=$query';

    try {
    final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'KakaoAK $kakaoApiKey'
        }
      );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<dynamic> documents = data['documents'];
      return documents;
    } else {
      logger.e('상호명으로 조회 요청 실패: ${response.statusCode}');
      return null;
    }} catch (e) {
      print('Error occurred while fetching search results: $e');
      throw Exception('Error occurred while fetching search results: $e');
    }
  }

  Future<List<dynamic>?> getPlaceByAddr(String query) async {
    String? kakaoApiKey = dotenv.env['DAJUNG_KAKAO_RESTAPI_KEY'];
    final String url = 'https://dapi.kakao.com/v2/local/search/address.json?query=$query';

    try {
    final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'KakaoAK $kakaoApiKey'
        }
      );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<dynamic> documents = data['documents'];
      print('addr : $documents');
      return documents;
    } else {
      logger.e('주소로 조회 요청 실패: ${response.statusCode}');
    }} catch (e) {
      print('Error occurred while fetching search results: $e');
      throw Exception('Error occurred while fetching search results: $e');
    }
  }
}