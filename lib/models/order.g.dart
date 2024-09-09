// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      id: (json['id'] as num?)?.toInt(),
      orderDate: json['orderDate'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      note: json['note'] as String?,
      status: json['status'],
      orderSheet:
          OrderSheet.fromJson(json['orderSheet'] as Map<String, dynamic>),
      additionalRequests: json['additionalRequests'] == null
          ? null
          : AdditionalRequest.fromJson(
              json['additionalRequests'] as Map<String, dynamic>),
      recall: json['recall'] == null
          ? null
          : Recall.fromJson(json['recall'] as Map<String, dynamic>),
      yesterdayId: (json['yesterdayId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderDate': instance.orderDate,
      'images': instance.images,
      'note': instance.note,
      'status': instance.status,
      'orderSheet': instance.orderSheet,
      'additionalRequests': instance.additionalRequests,
      'recall': instance.recall,
      'yesterdayId': instance.yesterdayId,
    };
