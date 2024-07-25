import 'package:bakery_app/view/auth/widget/sms_certification.dart';
import 'package:bakery_app/view/auth/widget/info_input.dart';
import 'package:bakery_app/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FindAuthPage extends StatelessWidget {
  const FindAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    int initialTabIndex = 0;
    RxBool isCertified = false.obs;

    return DefaultTabController(
        initialIndex: initialTabIndex,
        length: 2,
        child: Scaffold(
          appBar: AppBar(title: const Text("ID/PW 찾기")),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TabBar(
                  // indicatorColor: Colors.white,
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
                              InfoInput(),
                              CW.textButton('아이디 찾기')
                            ],
                          ),
                          Column(
                            children: [
                              SmsCertification(name: (String value) {  }, loginId: (String value) {  }, phone: (String value) {  },),
                              Obx(()=>CW.textButton(isCertified.value?'비밀번호 변경':'비밀번호 찾기'))
                            ],
                          )
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
