// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_sheet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderSheetImpl _$$OrderSheetImplFromJson(Map<String, dynamic> json) =>
    _$OrderSheetImpl(
      id: (json['id'] as num?)?.toInt(),
      dayOfTheWeek: json['dayOfTheWeek'],
      activated: json['activated'] as bool?,
      orderer: json['orderer'] == null
          ? null
          : User.fromJson(json['orderer'] as Map<String, dynamic>),
      orderItems: (json['orderItems'] as List<dynamic>)
          .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$OrderSheetImplToJson(_$OrderSheetImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dayOfTheWeek': instance.dayOfTheWeek,
      'activated': instance.activated,
      'orderer': instance.orderer,
      'orderItems': instance.orderItems,
    };
