// import 'dart:convert';
//
// import 'package:bakery_app/utils/configs.dart';
// import 'package:bakery_app/utils/secure_storage.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:http/http.dart' as http;
//
// class OrderRepository extends GetxController {
//
//   // SUB, DIRECT
//   Future<List<OrderSheet>?> getOrderSheets() async {
//     final Uri url = Uri.parse('$baseUrl/order');
//     String? accessToken = await SecureStorage.get(Cached.ACCESS);
//
//     if (accessToken == null) {
//       logger.e('액세스 토큰이 없습니다.');
//       return null;
//     }
//
//     final response = await http.get(
//       url,
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Authorization': 'Bearer $accessToken',
//       },
//     );
//
//     var responseBody = jsonDecode(response.body);
//     var bodyStatusCode = responseBody['statusCode'];
//     // print(responseBody);
//
//     if (bodyStatusCode == 200) {
//       dynamic data = responseBody['data'];
//       List<OrderSheet> orderSheets = [];
//       List<OrderItem> orderItemList = [];
//
//       if (data.isNotEmpty) {
//         data.forEach((orderSheet) {
//           String dayOfTheWeek = orderSheet['dayOfTheWeek'];
//           orderSheet['orderItems'].forEach((orderItem) {
//             orderItemList.add(OrderItem(item: Item.fromJson(orderItem['item']),
//                 quantity: orderItem['quantity']));
//           });
//           orderSheets.add(OrderSheet(
//               dayOfTheWeek: DayOfWeek.fromKor(dayOfTheWeek)!,
//               orderItems: orderItemList,
//               id: orderSheet['id']));
//           orderItemList = [];
//         });
//       }
//       return orderSheets;
//     } else {
//       logger.e('주문서 조회 요청 실패: $responseBody');
//     }
//   }
// }