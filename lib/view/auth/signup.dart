import 'dart:io';
import 'package:bakery_app/models/agreement.dart';
import 'package:bakery_app/models/user.dart';
import 'package:bakery_app/utils/enums.dart';
import 'package:bakery_app/view/auth/widget/address_search.dart';
import 'package:bakery_app/view/auth/widget/agreement_field.dart';
import 'package:bakery_app/view/auth/widget/password_confirmed.dart';
import 'package:bakery_app/view/auth/widget/role_selector.dart';
import 'package:bakery_app/view/auth/widget/sms_certification.dart';
import 'package:bakery_app/viewmodels/auth_service.dart';
import 'package:bakery_app/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  Rx<Role> role = Role.MAIN.obs;
  String loginId = '';
  String password = '';
  String storeName = '';
  String ownerName = '';
  String phone = '';
  String address = '';
  String x = '';
  String y = '';
  late List<Agreement> agreements;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
        appBar: AppBar(title: const Text("회원가입")),
        body:  SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: Form(
                key: formKey,
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RoleSelector(role: (value) => role.value = value),
                      SmsCertification(
                          name: (value) => ownerName = value,
                          loginId: (value) => loginId = value,
                          phone: (value) => phone = value),
                      PasswordConfirmed(password: (value) => password = value),
                      Obx(()=>role.value != Role.DELIVERY?AddressSearch(
                        storeName: (value) => storeName = value,
                        address: (value) => address = value,
                        x: (value) => x = value,
                        y: (value) => y = value):const SizedBox()),
                    ]),
              )),
        ),
        bottomNavigationBar: BottomAppBar(
            elevation: 0,
            child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 16, vertical: Platform.isAndroid ? 10 : 0),
                child: CW.textButton('다음', onPressed: (){
                  if(formKey.currentState!.validate()){
                    showModalBottomSheet(context: context, shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16))),builder: (context){
                      return AgreementField(role: role.value, agreements: (value) => agreements = value,
                          signIn: () => AuthService.to.signUp(User(role: role.value, loginId: loginId, password: password, storeName: storeName, ownerName: ownerName, phone: phone, status: JoinStatus.request, address: address, x: x, y: y, agreements: agreements),context));
                    });
                  }
                },
                ))));
  }
}
