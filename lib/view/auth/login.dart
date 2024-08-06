import 'package:bakery_app/utils/themeData.dart';
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
                  Row(crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Obx(() => Checkbox(onChanged: (v) => rememberMe.value = v!, value: rememberMe.value,fillColor: MaterialStatePropertyAll<Color>(rememberMe.value?CC.mainColor:Colors.white,))),
                      Text('자동 로그인', style: Theme.of(context).textTheme.bodyLarge,),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  CW.textButton('로그인',onPressed : ()=>AuthService.to.login(emailController.text, passwordController.text, rememberMe.value)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(onPressed: (){Get.toNamed('/findAuth');}, child: Text('ID/PW 찾기', style: Theme.of(context).textTheme.titleMedium?.copyWith(color:Colors.grey))),
                      TextButton(onPressed: (){Get.toNamed('/signup');}, child: Text('회원가입', style: Theme.of(context).textTheme.titleMedium?.copyWith(color:Colors.grey),)),
                    ],
                  )
                ],
              ),
            ),
          )
        );
  }
}
