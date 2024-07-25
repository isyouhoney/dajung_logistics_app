// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemCategoryImpl _$$ItemCategoryImplFromJson(Map<String, dynamic> json) =>
    _$ItemCategoryImpl(
      categoryName: json['categoryName'] as String,
      mainStore: User.fromJson(json['mainStore'] as Map<String, dynamic>),
      items: Item.fromJson(json['items'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ItemCategoryImplToJson(_$ItemCategoryImpl instance) =>
    <String, dynamic>{
      'categoryName': instance.categoryName,
      'mainStore': instance.mainStore,
      'items': instance.items,
    };
