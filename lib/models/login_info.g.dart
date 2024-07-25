// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginInfoImpl _$$LoginInfoImplFromJson(Map<String, dynamic> json) =>
    _$LoginInfoImpl(
      loginNumber: json['loginNumber'] as String,
      refreshToken: json['refreshToken'] as String,
      fcmToken: json['fcmToken'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LoginInfoImplToJson(_$LoginInfoImpl instance) =>
    <String, dynamic>{
      'loginNumber': instance.loginNumber,
      'refreshToken': instance.refreshToken,
      'fcmToken': instance.fcmToken,
      'user': instance.user,
    };
