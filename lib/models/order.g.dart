// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      orderSheet: json['orderSheet'] == null
          ? null
          : OrderSheet.fromJson(json['orderSheet'] as Map<String, dynamic>),
      orderDate: json['orderDate'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      status: json['status'],
      additionalRequests: json['additionalRequests'] == null
          ? null
          : AdditionalRequest.fromJson(
              json['additionalRequests'] as Map<String, dynamic>),
      recall: json['recall'] == null
          ? null
          : Recall.fromJson(json['recall'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      'orderSheet': instance.orderSheet,
      'orderDate': instance.orderDate,
      'images': instance.images,
      'status': instance.status,
      'additionalRequests': instance.additionalRequests,
      'recall': instance.recall,
    };
