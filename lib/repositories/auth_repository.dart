import 'dart:convert';
import 'package:bakery_app/models/user.dart';
import 'package:bakery_app/utils/configs.dart';
import 'package:bakery_app/utils/secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

int retryCount = 0;
const int maxRetryCount = 3;

class AuthRepository extends GetxController{
  Future<User?> getUserData() async {
    final Uri url = Uri.parse('$baseUrl/admin/detail');
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // String? accessToken = prefs.getString('accessToken');

    String? accessToken = await SecureStorage.get(Cached.ACCESS);
    if (accessToken == null) {
      logger.e('액세스 토큰이 없습니다.');
      return null;
    }

    while (retryCount < maxRetryCount) {
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
        Map<String, dynamic> data = responseBody['data'];
        print('data : $data');
        return User.fromJson(data);
      }
      else if (bodyStatusCode == 500) {
        final refreshResult = await refreshToken();
        if (!refreshResult) {
          logger.e('유저조회 - 리프레시 토큰 조회 실패 -> 재로그인해야함: ${response.statusCode}');
          break; // 리프레시 토큰도 만료되어 재로그인 필요
        }
        // 토큰 갱신 성공 후, 새로운 accessToken으로 다시 시도
        accessToken = await SecureStorage.get(Cached.ACCESS);
      } else {
        logger.e('유저 조회 요청 실패: ${response.statusCode}');
        break;
      }

      retryCount++;
      if (retryCount >= maxRetryCount) {
        logger.e('유저 조회 최대 재시도 횟수 초과');
      }
    }
    return null;
  }

  // 토큰 갱신
  Future<bool> refreshToken() async {
    final Uri url = Uri.parse('$baseUrl/admin/reissue');

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? refreshToken = prefs.getString('refreshToken');

    if (refreshToken == null) {
      print('리프레시 토큰이 없습니다.');
      return false;
    }

    final response = await http.post(url, headers: <String, String>{
      'Content-Type': 'application/json',
    }, body: jsonEncode({
      "refreshToken": refreshToken
    }),);

    var responseBody = jsonDecode(response.body);
    var bodyStatusCode = responseBody['statusCode'];

    if (bodyStatusCode == 200) {
      String newAccessToken = responseBody['data']['accessToken'];
      String newRefreshToken = responseBody['data']['refreshToken'];
      // 새 토큰을 저장
      await prefs.setString('accessToken', newAccessToken);
      await prefs.setString('refreshToken', newRefreshToken);
      return true;
    } else {
      print('토큰 갱신 요청 실패: ${response.statusCode}');
      await prefs.remove('accessToken');
      await prefs.remove('refreshToken');
      return false;
    }
  }

  Future<User?> postLoginData(String loginId, String password) async {
    final Uri url = Uri.parse('$baseUrl/admin/login');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'loginId': loginId,
        'password': password,
      }),
    );

    var responseBody = jsonDecode(response.body);
    var bodyStatusCode = responseBody['statusCode'];

    if (bodyStatusCode == 200) {
      var responseBody = jsonDecode(response.body);
      if (responseBody['data'] != null) {
        final result = responseBody['data'];
        String accessToken = result['accessToken'];
        String refreshToken = result['refreshToken'];

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('accessToken', accessToken);
        await prefs.setString('refreshToken', refreshToken);
        print('postlogindata : $result');

        return User.fromJson(result['admin']);
      } else {
        print('유저 데이터가 없습니다.');
        return null;
      }
    } else {
      logger.e('로그인 요청 실패: ${bodyStatusCode}, ${responseBody}');
      return responseBody['message'];
    }
  }

  Future<User?> patchUserEdit(String name, String password) async {
    final Uri url = Uri.parse('$baseUrl/admin');

    // TokenStorage에서 액세스 토큰 가져오기
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString('accessToken');

    if (accessToken == null) {
      logger.e('액세스 토큰이 없습니다.');
      return null;
    }

    final response = await http.patch(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken', // 액세스 토큰을 헤더에 포함
      },
      body: jsonEncode({
        'password': password,
        'name': name
      }),
    );

    var responseBody = jsonDecode(response.body);
    var bodyStatusCode = responseBody['statusCode'];

    if (bodyStatusCode == 200) {
      Map<String, dynamic> data = responseBody['data'];
      return User.fromJson(data);
    } else {
      logger.e('회원정보수정 요청 실패: ${response.statusCode}');
      return null;
    }
  }

  Future<User?> postSignup(String loginId, String name, String password) async {
    final Uri url = Uri.parse('$baseUrl/admin');

    // TokenStorage에서 액세스 토큰 가져오기
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString('accessToken');

    if (accessToken == null) {
      logger.e('액세스 토큰이 없습니다.');
      return null;
    }

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken', // 액세스 토큰을 헤더에 포함
      },
      body: jsonEncode({
        'loginId' : loginId,
        'name' : name,
        'password' : password,
        'role' : '관리자',
      }),
    );

    var responseBody = jsonDecode(response.body);
    var bodyStatusCode = responseBody['statusCode'];

    if (bodyStatusCode == 200) {
      Map<String, dynamic> data = responseBody['data'];
      return User.fromJson(data);
    } else {
      logger.e('회원가입 요청 실패: ${response.statusCode}');
      return null;
    }
  }

}
