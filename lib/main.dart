import 'dart:async';
import 'dart:convert';
import 'package:bakery_app/firebase_options.dart';
import 'package:bakery_app/repositories/delivery_repository.dart';
import 'package:bakery_app/repositories/item_repository.dart';
import 'package:bakery_app/repositories/notice_repository.dart';
import 'package:bakery_app/repositories/order_repository.dart';
import 'package:bakery_app/repositories/production_repository.dart';
import 'package:bakery_app/repositories/request_repository.dart';
import 'package:bakery_app/repositories/s3_repository.dart';
import 'package:bakery_app/repositories/search_place_repository.dart';
import 'package:bakery_app/utils/enums.dart';
import 'package:bakery_app/utils/notification.dart';
import 'package:bakery_app/utils/router.dart';
import 'package:bakery_app/utils/secure_storage.dart';
import 'package:bakery_app/utils/themeData.dart';
import 'package:bakery_app/viewmodels/auth_service.dart';
import 'package:bakery_app/viewmodels/delivery_service.dart';
import 'package:bakery_app/viewmodels/item_service.dart';
import 'package:bakery_app/viewmodels/notice_service.dart';
import 'package:bakery_app/viewmodels/order_service.dart';
import 'package:bakery_app/viewmodels/production_service.dart';
import 'package:bakery_app/viewmodels/report_service.dart';
import 'package:bakery_app/viewmodels/request_service.dart';
import 'package:bakery_app/viewmodels/search_place_service.dart';
import 'package:bakery_app/viewmodels/userType_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  try {
    print("백그라운드 메시지 처리.. ${message.data}");
  } catch (e) {
    print("백그라운드 메시지 처리 중 오류 발생: $e");
  }
}

// @pragma('vm:entry-point')
// void backgroundHandler(NotificationResponse details) {
//   try {
//     final message = RemoteMessage.fromMap(jsonDecode(details.toString()));
//     _handleMessage(message);
//   } catch (e) {
//     print("백그라운드 핸들러 처리 중 오류 발생: $e");
//   }
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FlutterLocalNotification.init();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await dotenv.load(fileName: '.env');
  InitialBinding().dependencies();

  dynamic userData = await AuthService.to.getUserData();
  String? islogin = await SecureStorage.get(Cached.ACCESS);
  String initialRoute = islogin == null ? '/login' : userData.role == Role.DELIVERY ? '/delivery': '/';
  runApp(MyApp(initialRoute: initialRoute));
}

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthService());
    Get.lazyPut(()=>UserTypeService());
    Get.lazyPut(()=>SearchPlaceService());
    Get.lazyPut(()=>SearchPlaceRepository());
    Get.lazyPut(()=>ItemRepository());
    Get.lazyPut(()=>ItemService());
    Get.put(S3Repository());
    Get.lazyPut(()=>OrderRepository());
    Get.lazyPut(()=>OrderService());
    Get.lazyPut(()=>ProductionRepository());
    Get.lazyPut(()=>ProductionService());
    Get.lazyPut(()=>RequestRepository());
    Get.lazyPut(()=>RequestService());
    Get.lazyPut(()=>DeliveryRepository());
    Get.lazyPut(()=>DeliveryService());
    Get.put(NoticeRepository());
    Get.put(NoticeService());
    Get.lazyPut(()=>ReportService());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.initialRoute});
  final String initialRoute;

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: light,
        initialRoute: initialRoute,
        initialBinding: InitialBinding(),
        getPages: getPages,
    );
  });
}}

