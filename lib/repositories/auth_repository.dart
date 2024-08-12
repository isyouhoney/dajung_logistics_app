import 'dart:convert';
import 'package:bakery_app/models/term.dart';
import 'package:bakery_app/models/user.dart';
import 'package:bakery_app/utils/configs.dart';
import 'package:bakery_app/utils/enums.dart';
import 'package:bakery_app/utils/secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_messaging/firebase_messaging.dart';

int retryCount = 0;
const int maxRetryCount = 3;

class AuthRepository extends GetxController{

  // 약관 조회
  Future<List?> getTerm(Role targets) async {
    final Uri url = Uri.parse('$baseUrl/terms?activated=true&targets=${targets.kor}');

      final response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );

      var responseBody = jsonDecode(response.body);
      var bodyStatusCode = responseBody['statusCode'];

      if (bodyStatusCode == 200) {
        List<dynamic> data = responseBody['data'];
        List<Term> termList = [];
        // data[0]['targets'] = targets;
        data.map((term){
          termList.add(Term(title: term['title'], content: term['content'], id: term['id']));
        }).toList();
        return termList;
      } else {
        logger.e('약관 조회 요청 실패: ${response.statusCode}');
      }
  }

  // 이메일 중복체크
  Future<bool?> checkEmail(String loginId) async {
    final Uri url = Uri.parse('$baseUrl/user/exists?loginId=$loginId');

      final response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );

      var responseBody = jsonDecode(response.body);
      var bodyStatusCode = responseBody['statusCode'];

      if (bodyStatusCode == 200) {
        Map<String, dynamic> data = responseBody['data'];
        print('data : $data');
        bool? isExist = data['exists'];
        return isExist;
      } else {
        logger.e('이메일 중복체크 요청 실패: ${response.statusCode}');
      }
  }

  // 회원가입 요청
  Future<bool?> postSignup(User user) async {
    final Uri url = Uri.parse('$baseUrl/user/signup');

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'role' : user.role.kor,
        'loginId' : user.loginId,
        'storeName' : user.storeName,
        'ownerName' : user.ownerName,
        'phone' : user.phone,
        'address' : user.address,
        'x' : user.x,
        'y' : user.y,
        'password' : user.password,
        'agreements' : user.agreements,
      }),
    );

    var responseBody = jsonDecode(response.body);
    var bodyStatusCode = responseBody['statusCode'];

    if (bodyStatusCode == 200) {
      Map result = responseBody['data'];
      return result['success'];
    } else {
      logger.e('회원가입 요청 실패: ${response.statusCode}');
      return false;
    }
  }

  Future<User?> getUserData() async {
    final Uri url = Uri.parse('$baseUrl/user');

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
        return User.fromJson(data);
      } else if (bodyStatusCode == 500) {
        final refreshResult = await refreshToken();
        if (!refreshResult) {
          logger.e('유저조회 - 리프레시 토큰 조회 실패 -> 재로그인해야함: ${response.statusCode}');
          break; // 리프레시 토큰도 만료되어 재로그인 필요
        }
        // 토큰 갱신 성공 후, 새로운 accessToken으로 다시 시도
        accessToken = await SecureStorage.get(Cached.ACCESS);
      } else {
        logger.e('유저 조회 요청 실패: $responseBody');
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
    final Uri url = Uri.parse('$baseUrl/user/reissue');

    String? refreshToken = await SecureStorage.get(Cached.REFRESH);

    if (refreshToken == null) {
      print('리프레시 토큰이 없습니다.');
      return false;
    }

    final response = await http.patch(url, headers: <String, String>{
      'Content-Type': 'application/json',
    }, body: jsonEncode({
      "refreshToken": refreshToken
    }),);

    var responseBody = jsonDecode(response.body);
    var bodyStatusCode = responseBody['statusCode'];

    if (bodyStatusCode == 200) {
      String newAccessToken = responseBody['data']['accessToken'];
      String newRefreshToken = responseBody['data']['refreshToken'];

      await SecureStorage.saveToken(newAccessToken, newRefreshToken);
      return true;
    } else {
      print('토큰 갱신 요청 실패: ${response.statusCode}');
      await SecureStorage.deleteAllTokens();
      return false;
    }
  }

  // 로그인
  Future<dynamic> postLoginData(String loginId, String password) async {
    final Uri url = Uri.parse('$baseUrl/user/login');
    final fcmToken = await FirebaseMessaging.instance.getToken();
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'loginId': loginId,
        'password': password,
        'fcmToken': fcmToken,
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

        await SecureStorage.saveToken(accessToken, refreshToken);
        await SecureStorage.set(Cached.FCM, fcmToken!);

        return User.fromJson(result['user']);
      } else {
        print('유저 데이터가 없습니다.');
        return null;
      }
    } else {
      logger.e('로그인 요청 실패: $responseBody');
      return responseBody['message'];
    }
  }

  // 회원정보 수정
  Future<User?> patchUserEdit(String name, String password) async {
    final Uri url = Uri.parse('$baseUrl/user/edit');

    String? accessToken = await SecureStorage.get(Cached.ACCESS);

    if (accessToken == null) {
      logger.e('액세스 토큰이 없습니다.');
      return null;
    }

    final response = await http.patch(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
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

  // 로그아웃
  Future<bool?> logout() async {
    final Uri url = Uri.parse('$baseUrl/user/logout');
    String? accessToken = await SecureStorage.get(Cached.ACCESS);

    final response = await http.delete(url,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken', // 액세스 토큰을 헤더에 포함
      },);
    var responseBody = jsonDecode(response.body);
    var bodyStatusCode = responseBody['statusCode'];

    if (bodyStatusCode == 200) {
      await SecureStorage.remove(Cached.ACCESS);
      await SecureStorage.remove(Cached.REFRESH);
      await SecureStorage.remove(Cached.SIGNIN);
      return true;
    } else {
      logger.e('로그아웃 요청 실패: ${response.statusCode}');
    }
    print('responseBody : $responseBody');
  }

  // 아이디 찾기
  Future<Map<String, dynamic>?> findId(String ownerName,String phone) async {
    final Uri url = Uri.parse('$baseUrl/user/check?ownerName=$ownerName&phone=$phone');

      final response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );

      var responseBody = jsonDecode(response.body);
      var bodyStatusCode = responseBody['statusCode'];
      print(responseBody);

      if (bodyStatusCode == 200) {
        Map<String, dynamic> data = responseBody['data'];
        await SecureStorage.clear();
        return data;
      } else {
        logger.e('아이디 찾기 요청 실패: ${response.statusCode}');
      }

    return null;
  }

  // 비밀번호 변경
  Future<Map<String, dynamic>?> changePassword(String loginId,String phone,String password) async {
    final Uri url = Uri.parse('$baseUrl/user/change-pwd');

      final response = await http.patch(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'loginId': loginId,
          'phone': phone,
          'password': password,
        }),
      );

      var responseBody = jsonDecode(response.body);
      var bodyStatusCode = responseBody['statusCode'];
      print(responseBody);

      if (bodyStatusCode == 200) {
        Map<String, dynamic> data = responseBody['data'];
        return data;
      } else {
        logger.e('비밀번호 변경 요청 실패: $responseBody');
      }

    return null;
  }
}
