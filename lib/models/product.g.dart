// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      item: Item.fromJson(json['item'] as Map<String, dynamic>),
      total: (json['total'] as num).toInt(),
      inventory: (json['inventory'] as num?)?.toInt(),
      production: json['production'] == null
          ? null
          : Production.fromJson(json['production'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'item': instance.item,
      'total': instance.total,
      'inventory': instance.inventory,
      'production': instance.production,
    };
