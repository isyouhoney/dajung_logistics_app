// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_sheet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderSheetImpl _$$OrderSheetImplFromJson(Map<String, dynamic> json) =>
    _$OrderSheetImpl(
      dayOfTheWeek: $enumDecode(_$DayOfWeekEnumMap, json['dayOfTheWeek']),
      activated: json['activated'] as bool?,
      orderer: json['orderer'] == null
          ? null
          : User.fromJson(json['orderer'] as Map<String, dynamic>),
      orderItems: (json['orderItems'] as List<dynamic>)
          .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      orders: json['orders'] as String?,
    );

Map<String, dynamic> _$$OrderSheetImplToJson(_$OrderSheetImpl instance) =>
    <String, dynamic>{
      'dayOfTheWeek': _$DayOfWeekEnumMap[instance.dayOfTheWeek]!,
      'activated': instance.activated,
      'orderer': instance.orderer,
      'orderItems': instance.orderItems,
      'orders': instance.orders,
    };

const _$DayOfWeekEnumMap = {
  DayOfWeek.mon: 'mon',
  DayOfWeek.tue: 'tue',
  DayOfWeek.wed: 'wed',
  DayOfWeek.tur: 'tur',
  DayOfWeek.fri: 'fri',
  DayOfWeek.sat: 'sat',
  DayOfWeek.sun: 'sun',
};
