// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recall_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecallItemImpl _$$RecallItemImplFromJson(Map<String, dynamic> json) =>
    _$RecallItemImpl(
      itemName: json['itemName'] as String,
      price: json['price'] as num,
      image: json['image'] as String,
      description: json['description'] as String,
      item: Item.fromJson(json['item'] as Map<String, dynamic>),
      recall: Recall.fromJson(json['recall'] as Map<String, dynamic>),
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$$RecallItemImplToJson(_$RecallItemImpl instance) =>
    <String, dynamic>{
      'itemName': instance.itemName,
      'price': instance.price,
      'image': instance.image,
      'description': instance.description,
      'item': instance.item,
      'recall': instance.recall,
      'quantity': instance.quantity,
    };
