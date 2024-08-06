import 'package:bakery_app/models/term.dart';
import 'package:bakery_app/models/user.dart';
import 'package:bakery_app/repositories/auth_repository.dart';
import 'package:bakery_app/utils/enums.dart';
import 'package:bakery_app/utils/secure_storage.dart';
import 'package:bakery_app/widgets/custom_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  final AuthRepository authRepository = AuthRepository();
  static AuthService get to => Get.find();
  RxMap<Term,bool> termsAgreed =<Term, bool>{}.obs;

  final _user = Rx<User?>(null);
  User? get user => _user.value;

  final isLoggedIn = false.obs;
  bool get isLoggedInValue => isLoggedIn.value;

  // void logout() {
  //   isLoggedIn.value = false;
  // }

  Future<List?> fetchTerm(Role targets) async {
    var fetchedTerm = await authRepository.getTerm(targets);
    if (fetchedTerm != null){
      return fetchedTerm;
    } else {
      print('약관을 불러오는데 실패했습니다.');
    }
  }

  Future<bool?> checkEmail(String email) async {
    var checkedEmail = await authRepository.checkEmail(email);
    if (checkedEmail != null){
      return checkedEmail;
    } else {
      print('이메일 중복체크에 실패했습니다.');
    }
  }


  Future signUp(User signupUser, BuildContext context) async {
    bool? user = await authRepository.postSignup(signupUser);
    if (user == true) {
      CW.dajungDialog(context,'회원가입 요청이 완료되었습니다.\n관리자 승인 후 로그인해주시기 바랍니다.','확인', () => Get.offAllNamed('/login'), false);
    } else {
      Get.snackbar('회원가입 실패', '회원가입 과정에서 문제가 발생했습니다. 다시 시도해주세요.');
    }
  }
  Future login(String loginId, String password, bool? rememberMe) async {
    User? user = await authRepository.postLoginData(loginId, password);
    if (user != null) {
      _user.value = user;
      isLoggedIn.value = true;
      await SecureStorage.set(Cached.SIGNIN, 'true');
      Get.snackbar('${user.ownerName}님, 반갑습니다!','오늘도 좋은 하루 보내세요.');
      Get.offAllNamed('/');
    } else {
      Get.snackbar('로그인 실패', '로그인 과정에서 문제가 발생했습니다. 다시 시도해주세요.');
    }
  }

  Future getUserData() async {
    final result = await authRepository.getUserData();
    if (result != null) {
      _user.value = result;
    }
    return result;
  }

  // 로그아웃
  Future<bool> logout() async {
    final result = await authRepository.logout();
    if (result != null) {
    _user.value = null;
    return true;
    } else{
      return false;
    }
  }

  // 아이디 찾기
  Future<Map?> findId(String ownerName,String phone) async {
    final result = await authRepository.findId(ownerName, phone);
    if (result != null) {
      return result;
    } else {

      return null;
    }
  }

  // 비밀번호 변경
  Future<Map?> changePassword(String loginId,String phone,String password) async {
    final result = await authRepository.changePassword(loginId, phone, password);
    if (result != null) {
      return result;
    } else {
      return null;
    }
  }
}