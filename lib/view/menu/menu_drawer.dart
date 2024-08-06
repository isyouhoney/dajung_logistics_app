import 'package:bakery_app/view/auth/login.dart';
import 'package:bakery_app/view/home.dart';
import 'package:bakery_app/view/menu/menu_items.dart';
import 'package:bakery_app/view/menu/notice/notice_registration.dart';
import 'package:bakery_app/viewmodels/auth_service.dart';
import 'package:bakery_app/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  // final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return
      // Theme(
      //   data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      //   child:
        Drawer(
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                    const SizedBox(height: 60),
                    // Padding(
                    //     padding: const EdgeInsets.symmetric(
                    //         vertical: 32.0, horizontal: 30),
                    //     child: Obx(() => _nickName(authController.user))),
                MenuItem(img: 'assets/icons/event_icon1.svg', title: '상품 관리', item: [
                  MenuContent(text: '품목 관리',onPress: () => Get.to(() => const HomeScreen())),
                  MenuContent(text: '당일 재고 입력', onPress: () => Get.to(const HomeScreen())),
                ]),
                MenuItem(img: 'assets/icons/notice_alert.svg', title: '데이터 통계', item: [
                  MenuContent(text: '주문 데이터 통계',onPress: () => Get.to(() => const HomeScreen())),
                  MenuContent(text: '생산 데이터 통계',onPress: () => Get.to(() => const HomeScreen())),
                ]),
                MenuItem(img: 'assets/icons/support_client.svg', title: '고객지원', item: [
                  MenuContent(text: '공지사항',onPress: () => Get.to(() => const NoticeRegistration()))]),
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
