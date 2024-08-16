// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recall.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecallImpl _$$RecallImplFromJson(Map<String, dynamic> json) => _$RecallImpl(
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      recallItems: (json['recallItems'] as List<dynamic>)
          .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RecallImplToJson(_$RecallImpl instance) =>
    <String, dynamic>{
      'images': instance.images,
      'recallItems': instance.recallItems,
    };
