import 'package:bakery_app/models/user.dart';
import 'package:bakery_app/utils/enums.dart';
import 'package:bakery_app/view/main/data/data_statistics.dart';
import 'package:bakery_app/view/main/item/item_management.dart';
import 'package:bakery_app/view/main/stock/daily_stock.dart';
import 'package:bakery_app/view/sub/additional/additional_request.dart';
import 'package:bakery_app/view/sub/history/order_history.dart';
import 'package:bakery_app/view/sub/history/sales_history.dart';
import 'package:bakery_app/view/sub/order/item_order.dart';
import 'package:bakery_app/viewmodels/auth_service.dart';
import 'package:bakery_app/widgets/custom_container.dart';
import 'package:bakery_app/widgets/default_layout.dart';
import 'package:bakery_app/widgets/home_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    User user = AuthService.to.user!;
    return DefaultLayout(
      isPadded: false,
      title: Image.asset(
        'assets/images/titlelogo.png',
        width: 170,
      ),
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Image.asset('assets/images/main_img.png', width: 100.w),
              Text(
                '안녕하세요, ${user.ownerName}님!\n지금은 재고 관리 시간입니다.',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              )
            ],
          ),
          HomeSection(
              title: '빵 생산 관리',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      onTap: () => Get.to(()=> user.role == Role.MAIN ? const ItemManagement() : ItemOrder()),
                      child: CustomContainer(
                        width: 130,
                        height: 70,
                        child: Center(child: Text(user.role == Role.MAIN ? '상품 관리' : '상품 주문', style: Theme.of(context).textTheme.titleMedium)),
                      )),
                  GestureDetector(
                      onTap: () => Get.to(() =>  user.role == Role.MAIN ? DailyStock() : AdditionalRequest()),
                      child: CustomContainer(
                          width: 130,
                          height: 70,
                          child: Center(child: Text(user.role == Role.MAIN ? '일일 생산 등록' : '수시 요청', style: Theme.of(context).textTheme.titleMedium)))),
                ],
              )),
          HomeSection(
            title: '데이터 확인',
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                    onTap: () => Get.to(() =>  user.role == Role.MAIN ? const DataStatistics() : SalesHistory()),
                    child: CustomContainer(
                      width: 130,
                      height: 70,
                      child: Center(child: Text(user.role == Role.MAIN ? '주문 데이터' : '판매 내역', style: Theme.of(context).textTheme.titleMedium)),
                    )),
                GestureDetector(
                    onTap: () => Get.to(() =>  user.role == Role.MAIN ? const DataStatistics() : const OrderHistory()),
                    child: CustomContainer(
                      width: 130,
                      height: 70,
                      child: Center(child: Text(user.role == Role.MAIN ? '생산 데이터' : '판매 내역', style: Theme.of(context).textTheme.titleMedium)),
                    )),
              ],
            ),
          ),
          HomeSection(title: '공지사항', child: Center(child: Text('등록된 공지사항이 없습니다.', style:TextStyle(color: Colors.grey))), seeMore: () {}),
        ],
      ),
    );
  }
}
