import 'package:bakery_app/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_info.freezed.dart';
part 'login_info.g.dart';

@freezed
class LoginInfo with _$LoginInfo {
  const LoginInfo._();
  factory LoginInfo({
    required String loginNumber,
    required String refreshToken,
    required String fcmToken,
    required User user,
}) = _LoginInfo;

  factory LoginInfo.fromJson(Map<String, dynamic> json) =>
      _$LoginInfoFromJson(json);
}