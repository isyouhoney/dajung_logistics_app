// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      orderSheet:
          OrderSheet.fromJson(json['orderSheet'] as Map<String, dynamic>),
      production:
          Production.fromJson(json['production'] as Map<String, dynamic>),
      orderDate: json['orderDate'] as String,
      image: json['image'] as String,
      status: $enumDecode(_$OrderStatusEnumMap, json['status']),
      additionalRequests: AdditionalRequest.fromJson(
          json['additionalRequests'] as Map<String, dynamic>),
      recall: Recall.fromJson(json['recall'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      'orderSheet': instance.orderSheet,
      'production': instance.production,
      'orderDate': instance.orderDate,
      'image': instance.image,
      'status': _$OrderStatusEnumMap[instance.status]!,
      'additionalRequests': instance.additionalRequests,
      'recall': instance.recall,
    };

const _$OrderStatusEnumMap = {
  OrderStatus.ordered: 'ordered',
  OrderStatus.delivered: 'delivered',
  OrderStatus.deliveryChecked: 'deliveryChecked',
};
