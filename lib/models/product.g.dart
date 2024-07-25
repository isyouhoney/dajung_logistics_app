// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      itemName: json['itemName'] as String,
      price: json['price'] as String,
      image: json['image'] as String,
      description: json['description'] as String,
      item: json['item'] as String,
      total: json['total'] as String,
      inventory: json['inventory'] as String,
      production: json['production'] as String,
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'itemName': instance.itemName,
      'price': instance.price,
      'image': instance.image,
      'description': instance.description,
      'item': instance.item,
      'total': instance.total,
      'inventory': instance.inventory,
      'production': instance.production,
    };
