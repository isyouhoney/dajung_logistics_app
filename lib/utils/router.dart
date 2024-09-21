import 'package:bakery_app/utils/configs.dart';
import 'package:bakery_app/utils/enums.dart';
import 'package:bakery_app/view/auth/find_auth.dart';
import 'package:bakery_app/view/auth/login.dart';
import 'package:bakery_app/view/auth/signup.dart';
import 'package:bakery_app/view/home.dart';
import 'package:bakery_app/view/main/stock/daily_stock.dart';
import 'package:bakery_app/view/ride/additional_order_delivery.dart';
import 'package:bakery_app/view/ride/delivery_list.dart';
import 'package:bakery_app/view/sub/additional/additional_request.dart';
import 'package:bakery_app/view/sub/history/delivery/store_delivery_history.dart';
import 'package:bakery_app/view/sub/order/item_order.dart';
import 'package:bakery_app/viewmodels/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

List<GetPage> getPages = [
  GetPage(name: '/', page: () => const HomeScreen()), //middlewares: [AuthMiddleware()]),
  GetPage(name: '/delivery', page: () => const DeliveryList()), //middlewares: [AuthMiddleware()]),
  GetPage(name: '/login', page: () => const Login()),
  GetPage(name: '/signup', page: () => const Signup()),
  GetPage(name: '/findAuth', page: () => const FindAuthPage()),
  GetPage(name: '/dailyStock', page: () => const DailyStock()),
  GetPage(name: '/itemOrder', page: () => const ItemOrder()),
  GetPage(name: '/deliveryHistory', page: () => const DeliveryHistory()),
  GetPage(name: '/additionalRequest', page: () => const AdditionalRequest()),
  GetPage(name: '/additionalOrderDelivery', page: () => const AdditionalOrderDelivery()),
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
