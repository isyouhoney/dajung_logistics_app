import 'package:get/get.dart';

enum UserType {main, sub, ride}

class UserTypeService extends GetxService {
  static UserTypeService get to => Get.find();
  final Rx<UserType> userType = UserType.main.obs;

  // @override
  // void onInit() {
  //   // TODO: implement onInit
  //   super.onInit();
  //   userType.value = UserType.main;
  // }
}