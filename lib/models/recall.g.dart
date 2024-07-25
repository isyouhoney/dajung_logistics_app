// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recall.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecallImpl _$$RecallImplFromJson(Map<String, dynamic> json) => _$RecallImpl(
      image: json['image'] as String,
      storeOwnerCheck: json['storeOwnerCheck'] as bool,
      recallItems: Recall.fromJson(json['recallItems'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RecallImplToJson(_$RecallImpl instance) =>
    <String, dynamic>{
      'image': instance.image,
      'storeOwnerCheck': instance.storeOwnerCheck,
      'recallItems': instance.recallItems,
    };
