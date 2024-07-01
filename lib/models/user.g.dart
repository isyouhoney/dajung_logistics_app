// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      loginId: json['loginId'] as String,
      password: json['password'] as String?,
      role: json['role'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'loginId': instance.loginId,
      'password': instance.password,
      'role': instance.role,
      'name': instance.name,
    };
