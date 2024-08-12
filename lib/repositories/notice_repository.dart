import 'dart:convert';
import 'package:bakery_app/models/notice.dart';
import 'package:bakery_app/utils/configs.dart';
import 'package:bakery_app/utils/secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NoticeRepository extends GetxController {
  Future<List?> fetchNotices(int skip, int take) async {
    final Uri url = Uri.parse('$baseUrl/notification?skip=$skip&take=$take');
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
      List<Notice> itemList = [];
      data.map((item) => itemList.add(Notice.fromJson(item))).toList();
      return itemList;
    } else {
      logger.e('공지 조회 요청 실패: $responseBody');
    }
  }

  Future<bool?> postNotice(Notice notice) async {
    final Uri url = Uri.parse('$baseUrl/notification');
    String? accessToken = await SecureStorage.get(Cached.ACCESS);

    if (accessToken == null) {
      logger.e('액세스 토큰이 없습니다.');
      return null;
    }

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode({
        'title': notice.title,
        'content': notice.content,
        'images': notice.images,
        'topFixed': notice.topFixed,
        'targets': [
          {"target": "마스터"},
          {"target": "메인"},
          {"target": "직영"},
          {"target": "가맹"},
        ],
      }),
    );

    var responseBody = jsonDecode(response.body);
    var bodyStatusCode = responseBody['statusCode'];
    print(responseBody);

    if (bodyStatusCode == 200) {
      // Map data = responseBody['data'];

      return true;
    } else {
      logger.e('공지 등록 요청 실패: $responseBody');
    }
  }

  Future<bool?> editNotice(Notice notice) async {
    final Uri url = Uri.parse('$baseUrl/notification');
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
        'title': notice.title,
        'content': notice.content,
        'images': notice.images,
        'topFixed': notice.topFixed,
        'targets': [
          {"target": "마스터"},
          {"target": "메인"},
          {"target": "직영"},
          {"target": "가맹"},
        ],
      }),
    );

    var responseBody = jsonDecode(response.body);
    var bodyStatusCode = responseBody['statusCode'];

    if (bodyStatusCode == 200) {
      return true;
    } else {
      logger.e('공지 수정 요청 실패: $responseBody');
    }
  }

  Future<bool?> deleteNotice(int id) async {
    final Uri url = Uri.parse('$baseUrl/notification?id=$id');
    String? accessToken = await SecureStorage.get(Cached.ACCESS);

    if (accessToken == null) {
      logger.e('액세스 토큰이 없습니다.');
      return false;
    }

    final response = await http.delete(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
    );

    var responseBody = jsonDecode(response.body);
    var bodyStatusCode = responseBody['statusCode'];

    if (bodyStatusCode == 200) {
      return true;
    } else {
      logger.e('공지 삭제 요청 실패: $responseBody');
    }
  }
}