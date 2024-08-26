// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'additional_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdditionalRequestImpl _$$AdditionalRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$AdditionalRequestImpl(
      id: (json['id'] as num?)?.toInt(),
      orderItem: OrderItem.fromJson(json['orderItem'] as Map<String, dynamic>),
      requestDate: json['requestDate'] as String,
      request: json['request'] == null
          ? null
          : User.fromJson(json['request'] as Map<String, dynamic>),
      accept: json['accept'] == null
          ? null
          : User.fromJson(json['accept'] as Map<String, dynamic>),
      status: json['status'],
    );

Map<String, dynamic> _$$AdditionalRequestImplToJson(
        _$AdditionalRequestImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderItem': instance.orderItem,
      'requestDate': instance.requestDate,
      'request': instance.request,
      'accept': instance.accept,
      'status': instance.status,
    };
