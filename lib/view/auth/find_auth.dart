import 'package:bakery_app/utils/themeData.dart';
import 'package:bakery_app/view/auth/widget/password_confirmed.dart';
import 'package:bakery_app/view/auth/widget/sms_certification.dart';
import 'package:bakery_app/viewmodels/auth_service.dart';
import 'package:bakery_app/widgets/custom_widget.dart';
import 'package:bakery_app/widgets/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FindAuthPage extends StatelessWidget {
  const FindAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    int initialTabIndex = 0;
    String name = '';
    String phone = '';
    String loginId = '';
    String password = '';
    RxBool isCertified = false.obs;

    return DefaultTabController(
        initialIndex: initialTabIndex,
        length: 2,
        child: DefaultLayout(isPadded: false,
          title: "ID/PW 찾기",
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TabBar(
                  indicatorColor: CC.mainColor,
                  labelStyle: Theme.of(context).textTheme.titleSmall,
                  tabs: const [
                    Tab(text: '아이디 찾기'),
                    Tab(text: '비밀번호 찾기'),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          Column(
                            children: [
                              SmsCertification(name: (value) => name = value, phone: (value) => phone = value),
                              CW.textButton('아이디 찾기', onPressed: (){
                                AuthService.to.findId(name, phone).then((value){
                                  CW.dajungDialog(context, value!=null?'${value?['ownerName']}님의 아이디는\n"${value?['loginId']}"입니다.':'가입된 회원정보가 없습니다.\n입력 정보를 확인해주세요.', '확인', ()=>Get.back(), false);
                                });
                              })
                            ],
                          ),
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                SmsCertification(name: (value) => name = value, loginId: (value) => loginId = value, phone: (value) => phone = value, noDuplicateCheck: true,),
                                Obx(() => isCertified.value ? PasswordConfirmed(password: (value) => password = value):const SizedBox()),
                                Obx(() => CW.textButton(isCertified.value ? '비밀번호 변경':'비밀번호 찾기', onPressed: (){
                                  isCertified.value == false? AuthService.to.findId(name, phone).then((value){
                                    value == null ? CW.dajungDialog(context, '가입된 회원정보가 없습니다.\n입력 정보를 확인해주세요.', '확인', () => Get.back(), false):
                                    isCertified.value = true;
                                  }) : AuthService.to.changePassword(loginId, phone, password).then((value){
                                    CW.dajungDialog(context, value!=null?'비밀번호가 변경되었습니다.':'가입된 아이디가 없습니다.\n입력 정보를 확인해주세요.', '확인', () => Get.back(), false);
                                  });
                                }))
                              ],
                            ),
                          )
                        ]),
                  ),
                ),
              ],
            ),
        ));
  }
}
