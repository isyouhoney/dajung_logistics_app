import 'package:bakery_app/utils/themeData.dart';
import 'package:bakery_app/viewmodels/auth_service.dart';
import 'package:bakery_app/widgets/custom_textfield.dart';
import 'package:bakery_app/widgets/custom_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SmsCertification extends StatefulWidget {
  const SmsCertification({super.key, required this.name, this.loginId, required this.phone, this.noDuplicateCheck=false});
  final ValueChanged<String> name;
  final ValueChanged<String>? loginId;
  final ValueChanged<String> phone;
  final bool? noDuplicateCheck;

  @override
  State<SmsCertification> createState() => _SmsCertificationState();
}

class _SmsCertificationState extends State<SmsCertification> {
  late RxBool isSent;
  late RxBool isCertified;
  late RxBool isDuplicate;
  late TextEditingController nameController;
  late TextEditingController idController;
  late TextEditingController phoneNumberController;
  late TextEditingController codeController;
  late String _verificationId;
  final emailFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    isSent = false.obs;
    isCertified = false.obs;
    isDuplicate = true.obs;
    nameController = TextEditingController();
    idController = TextEditingController();
    phoneNumberController = TextEditingController();
    codeController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    idController.dispose();
    phoneNumberController.dispose();
    codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomTextField(
          onChanged: (value)=>widget.name(value),
            hintText: '성함',
            validator: (val) {
              return null;
            },
            controller: nameController,
        ),
    widget.loginId!=null?Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
    Form(
    key: emailFormKey,
    child:CustomTextField(
              onChanged: (value)=>widget.loginId!(value),
              hintText: '이메일',
              validator: (val) {
                if(!RegExp(
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                    .hasMatch(val!)){
                  return '잘못된 이메일 형식입니다. 올바른 이메일 형식으로 입력해주세요.';
                }
                return null;
              },
              controller: idController,
              width: widget.noDuplicateCheck!=true? 100.w - 130 : 100.w-20,
            )),
            widget.noDuplicateCheck!=true?Padding(
              padding: const EdgeInsets.fromLTRB(10,5,0,5),
              child: Obx(()=>CW.textButton(!isDuplicate.value ? '사용 가능':'중복 체크', width: 100, height: 50,
                color: !isDuplicate.value ? Colors.grey : CC.mainColor,
                onPressed: () async {
                  if(emailFormKey.currentState!.validate()){
                  isDuplicate.value = (await AuthService.to.checkEmail(idController.text))!;
                  isDuplicate.value ? CW.dajungDialog(context,'${idController.text}은\n이미 사용중인 이메일입니다.','확인', () => Get.back(), false):
                  CW.dajungDialog(context,'${idController.text}은\n사용 가능한 이메일입니다.','확인', () { Get.back();FocusScope.of(context).requestFocus(FocusNode());}, false);
                  }
                }
              )),
            ):const SizedBox(),
        const SizedBox(height: 20),
          ],
        ):const SizedBox(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              onChanged: (value)=>widget.phone(value),
              hintText: '핸드폰 번호',
              validator: (val) {
                if (val!.contains(RegExp(r'[^0-9]'))) return '올바른 번호를 입력하세요.';
                return null;
              },
              controller: phoneNumberController,
              width: 100.w - 130,
            ),
            const SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Obx(()=>CW.textButton(isSent.value?'재발송':'인증번호발송', width: 100, height: 50, color: isCertified.value? Colors.grey: CC.mainColor,
                  onPressed: () async {
                String phoneNumber = '+82${phoneNumberController.text.substring(1)}';
                FirebaseAuth auth = FirebaseAuth.instance;
                await auth.verifyPhoneNumber(
                    phoneNumber: phoneNumber,
                    timeout: const Duration(minutes: 2),
                    verificationCompleted: (credential) async {
                      // Andriod 코드확인 자동 처리
                      await auth.signInWithCredential(credential).then((_) {
                        isCertified.value = true;
                        Get.snackbar('휴대폰 인증 완료', '휴대폰 인증이 완료되었습니다.');
                      });
                    },
                    verificationFailed: (e) {
                      Get.snackbar('휴대폰 인증 실패', '유효하지 않은 번호입니다.');
                      print(e);
                    },
                    codeSent: (String verificationId, int? forceResendingToken) async {
                      Get.snackbar('코드 전송 완료', '입력하신 번호로 코드가 전송되었습니다.');
                      isSent.value = true;
                      _verificationId = verificationId;
                    },
                    codeAutoRetrievalTimeout: (verificationId) {});
                FocusScope.of(context).requestFocus(FocusNode());
              })),
            )
          ],
        ),
        Obx(()=>Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              textColor: isCertified.value ? Colors.grey : Colors.black,
              readOnly: isCertified.value,
              hintText: '인증번호',
              validator: (val) {
                if(val!.length != 6){
                  return '올바른 인증번호 6자를 입력해주세요.';
                } else if (val.contains(RegExp(r'[^0-9]'))) {
                  return '올바른 인증번호를 입력해주세요.';
                }
                // else if (isCertified.value = false) {
                //   return '휴대폰 인증을 완료해주세요.';
                // }
                return null;
              },
              controller: codeController,
              width: 100.w - 130,
            ),
            const SizedBox(width: 10),
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: CW.textButton(isCertified.value?'인증완료':'인증번호확인', width: 100, height: 50, color: !isSent.value? Colors.grey: isCertified.value ?Colors.grey:CC.mainColor,
                  onPressed: () async {
                FirebaseAuth auth = FirebaseAuth.instance;
                PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    verificationId: _verificationId,
                    smsCode: codeController.text);
                await auth.signInWithCredential(credential).then((_) { isCertified.value = true; FocusScope.of(context).requestFocus(FocusNode());});
              }),
    )
          ],
        )),
            const SizedBox(height: 20),
      ],
    );
  }
}
