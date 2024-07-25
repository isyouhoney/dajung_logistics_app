import 'dart:convert';
import 'package:bakery_app/models/item.dart';
import 'package:bakery_app/models/term.dart';
import 'package:bakery_app/models/user.dart';
import 'package:bakery_app/utils/configs.dart';
import 'package:bakery_app/utils/enums.dart';
import 'package:bakery_app/utils/secure_storage.dart';
import 'package:bakery_app/viewmodels/auth_service.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_messaging/firebase_messaging.dart';

class ItemRepository extends GetxController {
  Future<List?> getItems() async {
    final Uri url = Uri.parse('$baseUrl/item');
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
      List<Item> itemList = [];
      // data.map((item) {
      //   itemList.add(Item(itemName: '', price: null, images: '', description: '', category: null, status: null, owner: null, targets: null));
      // }).toList();
      return itemList;
    } else {
      logger.e('제품 리스트 조회 요청 실패: ${response.statusCode}');
    }
  }

  Future<bool?> postItem(Item item) async {
    final Uri url = Uri.parse('$baseUrl/item');
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
        'itemName' : item.itemName,
        'price' : item.price,
        'image' : item.images,
        'description' : item.description,
        'category' : item.category,
        'owner' : AuthService.to.user,
        'targets' : [
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
      Item data = responseBody['data'];
      print(data);
      return true;
    } else {
      logger.e('제품 등록 요청 실패: ${response.statusCode}');
      return false;
    }
  }
}
