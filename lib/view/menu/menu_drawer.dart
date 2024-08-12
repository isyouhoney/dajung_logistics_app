import 'package:bakery_app/models/user.dart';
import 'package:bakery_app/utils/enums.dart';
import 'package:bakery_app/view/auth/login.dart';
import 'package:bakery_app/view/main/data/data_statistics.dart';
import 'package:bakery_app/view/main/item/item_management.dart';
import 'package:bakery_app/view/main/stock/daily_stock.dart';
import 'package:bakery_app/view/menu/menu_items.dart';
import 'package:bakery_app/view/menu/notice/notice_registration.dart';
import 'package:bakery_app/view/menu/notice/notice_screen.dart';
import 'package:bakery_app/view/sub/additional/additional_request.dart';
import 'package:bakery_app/view/sub/history/delivery/delivery_history.dart';
import 'package:bakery_app/view/sub/history/order_history.dart';
import 'package:bakery_app/view/sub/history/sales/sales_history.dart';
import 'package:bakery_app/view/sub/order/item_order.dart';
import 'package:bakery_app/viewmodels/auth_service.dart';
import 'package:bakery_app/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    User user = AuthService.to.user!;
    return Drawer(
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                    const SizedBox(height: 80),
                    // Padding(
                    //     padding: const EdgeInsets.symmetric(
                    //         vertical: 32.0, horizontal: 30),
                    //     child: Obx(() => _nickName(authController.user))),
                MenuItem(img: 'assets/icons/event_icon1.svg', title: user.role == Role.MAIN ? '상품 관리' : '주문', item: [
                  MenuContent(text: user.role == Role.MAIN ? '품목 관리' : '상품 주문',onPress: () => Get.to(() => user.role == Role.MAIN ? const ItemManagement() :  const ItemOrder())),
                  MenuContent(text: user.role == Role.MAIN ? '당일 재고 입력' : '추가 요청', onPress: () => Get.to(user.role == Role.MAIN ? const DailyStock() : const AdditionalRequest())),
                ]),
                MenuItem(img: 'assets/icons/notice_alert.svg', title: user.role == Role.MAIN ? '데이터 통계' : '내역 확인', item: [
                  MenuContent(text: user.role == Role.MAIN ? '주문 데이터 통계' : '주문 내역',onPress: () => Get.to(() => user.role == Role.MAIN ? const DataStatistics() : const OrderHistory())),
                  MenuContent(text: user.role == Role.MAIN ? '생산 데이터 통계' : '판매 내역',onPress: () => Get.to(() => user.role == Role.MAIN ? const DataStatistics() : const SalesHistory())),
                  user.role == Role.SUB ? MenuContent(text: '배송 내역',onPress: () => Get.to(() => const DeliveryHistory())): const SizedBox(),
                ]),
                MenuItem(img: 'assets/icons/support_client.svg', title: '고객지원', item: [
                  MenuContent(text: '공지사항',onPress: () => Get.to(() => const NoticeScreen()))]),
                // MenuItem(img: 'assets/icons/setting_icon.svg', title: '설정', item: [
                //   // MenuContent(text: '알림설정', onPress: () => Get.to(const HomeScreen())),
                //   MenuContent(text: '로그아웃',onPress: () {
                //   // CW.allParkDialog(
                //   //     context,
                //   //     '로그아웃하시겠습니까?',
                //   //     '로그아웃',
                //   //         () {
                //   //       authController.logout().then((value) =>
                //   //       {Get.offAll(() => const HomeScreen())}); // 사용자 로그아웃 처리
                //   //     },true);
                //   })], dividerShow: false,),
                GestureDetector(
                  onTap: () {
                    CW.dajungDialog(
                        context,
                        '로그아웃 하시겠습니까?',
                        '네',
                            () async {
                          await AuthService.to.logout().then((value) =>
                          {if (value)Get.offAll(() => const Login())
                            else Get.snackbar("로그아웃에 실패했습니다", '다시 한번 시도해주세요.')
                          });
                        },
                        true
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                    child: Text(
                      '로그아웃',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),
                    ),
                  ),
                )
              ],
            ),
          ),
        // )
    );
  }

  // Widget _nickName(User? user) {
  //   final String? name = user?.nickname;
  //   return Text(
  //     name!=null?"안녕하세요,\n$name님." : "로그인이 필요합니다.",
  //     style: TextStyle(
  //         fontSize: 24, fontWeight: FontWeight.w700, height: 1.5),
  //   );
  // }
}
