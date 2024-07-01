import 'package:bakery_app/main.dart';
import 'package:bakery_app/utils/configs.dart';
import 'package:bakery_app/viewmodels/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

List<GetPage> getPages = [
  GetPage(name: '/', page: () => const MyHomePage(), middlewares: [AuthMiddleware()]),
];

class AuthMiddleware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    logger.i('---------------onPageCalled');
    return super.onPageCalled(page);
  }

  @override
  List<Bindings>? onBindingsStart(List<Bindings>? bindings) {
    logger.i('---------------onPageCalled');
    return super.onBindingsStart(bindings);
  }

  @override
  GetPageBuilder? onPageBuildStart(GetPageBuilder? page) {
    logger.i('---------------onPageBuildStart');
    return super.onPageBuildStart(page);
  }

  @override
  void onPageDispose() {
    logger.i('---------------onPageDispose');
    super.onPageDispose();
  }

  @override
  RouteSettings? redirect(String? route) {
    if (!AuthService.to.isLoggedInValue) return const RouteSettings(name: '/');
    return null;
  }
}
