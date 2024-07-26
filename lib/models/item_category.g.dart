// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemCategoryImpl _$$ItemCategoryImplFromJson(Map<String, dynamic> json) =>
    _$ItemCategoryImpl(
      id: (json['id'] as num).toInt(),
      categoryName: json['categoryName'] as String,
      mainStore: json['mainStore'] == null
          ? null
          : User.fromJson(json['mainStore'] as Map<String, dynamic>),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ItemCategoryImplToJson(_$ItemCategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoryName': instance.categoryName,
      'mainStore': instance.mainStore,
      'items': instance.items,
    };
