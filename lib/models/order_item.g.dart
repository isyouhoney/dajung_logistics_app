// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderItemImpl _$$OrderItemImplFromJson(Map<String, dynamic> json) =>
    _$OrderItemImpl(
      itemName: json['itemName'] as String,
      price: json['price'] as num,
      image: json['image'] as String,
      description: json['description'] as String,
      orderSheet:
          OrderSheet.fromJson(json['orderSheet'] as Map<String, dynamic>),
      item: Item.fromJson(json['item'] as Map<String, dynamic>),
      quantity: json['quantity'] as num,
    );

Map<String, dynamic> _$$OrderItemImplToJson(_$OrderItemImpl instance) =>
    <String, dynamic>{
      'itemName': instance.itemName,
      'price': instance.price,
      'image': instance.image,
      'description': instance.description,
      'orderSheet': instance.orderSheet,
      'item': instance.item,
      'quantity': instance.quantity,
    };
