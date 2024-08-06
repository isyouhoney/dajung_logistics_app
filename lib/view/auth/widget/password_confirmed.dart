import 'package:bakery_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class PasswordConfirmed extends StatefulWidget {
  const PasswordConfirmed({super.key, required this.password});
  final ValueChanged<String> password;

  @override
  State<PasswordConfirmed> createState() => _PasswordConfirmedState();
}

class _PasswordConfirmedState extends State<PasswordConfirmed> {
  late TextEditingController passwordController;
  late TextEditingController passwordCheckController;
  // final passwordFormKey = GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    passwordCheckController = TextEditingController();
  }

  @override
  void dispose() {
    passwordController.dispose();
    passwordCheckController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextField(
              onChanged: (value)=>widget.password(value),
            maxLine: 1,
            obscureText: true,
              hintText: '비밀번호(8자 이상 영문, 숫자, 특수문자 조합)',
              validator: (val) {
                if(val!.length < 8){
                  return '8자 이상 입력해주세요.';
                } else if(!RegExp(r'^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,15}$')
                // r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?~^<>,.&+=])[A-Za-z\d$@$!%*#?~^<>,.&+=]{8,15}$'
                    .hasMatch(val)){
                  return '8자 이상 영문, 숫자, 특수문자 조합을 입력해주세요.';
                }
                return null;
              },
              controller: passwordController),
          CustomTextField(
            maxLine: 1,
              obscureText: true,
              hintText: '비밀번호 확인',
              validator: (val) {
                if(val!.length < 8){
                  return '8자 이상 입력해주세요.';
                } else if (passwordController.text != passwordCheckController.text) {
                  return '입력한 비밀번호가 서로 다릅니다.';
                }
                return null;
              },
              controller: passwordCheckController),
          const SizedBox(height: 20),
        ]);
  }
}