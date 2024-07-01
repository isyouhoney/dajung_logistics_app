import 'package:bakery_app/utils/router.dart';
import 'package:bakery_app/utils/themeData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  InitialBinding().dependencies();
  runApp(const MyApp());
}

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return GetMaterialApp(
      title: 'Dajung',
      theme: light,
        initialRoute: '/',
        initialBinding: InitialBinding(),
        getPages: getPages,
    );
  });
}}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
