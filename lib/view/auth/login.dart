import 'package:bakery_app/viewmodels/auth_service.dart';
import 'package:bakery_app/widgets/custom_textfield.dart';
import 'package:bakery_app/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    RxBool rememberMe = false.obs;

    return GestureDetector(
        onTap: () {
      FocusScope.of(context).unfocus();
    },
    child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('로그인', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 20),
            CustomTextField(hintText: '아이디(이메일)',
                validator: (val) {
                  return null;
                },
                controller: emailController),
            CustomTextField(hintText: '비밀번호', obscureText: true, maxLine: 1,
                validator: (val) {
                  return null;
                },
                controller: passwordController),
            Obx(()=>CheckboxMenuButton(onChanged: (v) => rememberMe.value = v!, value: rememberMe.value, child: const Text('자동 로그인'))),
            CW.textButton('로그인',onPressed : ()=>AuthService.to.login(emailController.text, passwordController.text, rememberMe.value)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: (){Get.toNamed('/findAuth');}, child: const Text('ID/PW 찾기')),
                TextButton(onPressed: (){Get.toNamed('/signup');}, child: const Text('회원가입')),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
