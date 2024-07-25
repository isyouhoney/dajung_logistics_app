import 'package:bakery_app/firebase_options.dart';
import 'package:bakery_app/repositories/item_repository.dart';
import 'package:bakery_app/repositories/search_place_repository.dart';
import 'package:bakery_app/utils/router.dart';
import 'package:bakery_app/utils/secure_storage.dart';
import 'package:bakery_app/utils/themeData.dart';
import 'package:bakery_app/viewmodels/auth_service.dart';
import 'package:bakery_app/viewmodels/item_service.dart';
import 'package:bakery_app/viewmodels/search_place_service.dart';
import 'package:bakery_app/viewmodels/userType_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await dotenv.load(fileName: '.env');
  InitialBinding().dependencies();

  dynamic userData = await AuthService.to.getUserData();
  String? islogin = await SecureStorage.get(Cached.SIGNIN);
  String initialRoute = islogin==null ? '/login':'/';
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

