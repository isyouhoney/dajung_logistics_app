// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemImpl _$$ItemImplFromJson(Map<String, dynamic> json) => _$ItemImpl(
      itemName: json['itemName'] as String,
      price: (json['price'] as num).toInt(),
      images: json['images'] as String,
      description: json['description'] as String,
      category: ItemCategory.fromJson(json['category'] as Map<String, dynamic>),
      status: $enumDecodeNullable(_$ItemStatusEnumMap, json['status']),
      owner: json['owner'] == null
          ? null
          : User.fromJson(json['owner'] as Map<String, dynamic>),
      targets: (json['targets'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$RoleEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$$ItemImplToJson(_$ItemImpl instance) =>
    <String, dynamic>{
      'itemName': instance.itemName,
      'price': instance.price,
      'images': instance.images,
      'description': instance.description,
      'category': instance.category,
      'status': _$ItemStatusEnumMap[instance.status],
      'owner': instance.owner,
      'targets': instance.targets?.map((e) => _$RoleEnumMap[e]!).toList(),
    };

const _$ItemStatusEnumMap = {
  ItemStatus.onSale: 'onSale',
  ItemStatus.endOfSale: 'endOfSale',
};

const _$RoleEnumMap = {
  Role.MASTER: 'MASTER',
  Role.MAIN: 'MAIN',
  Role.DIRECT: 'DIRECT',
  Role.SUB: 'SUB',
  Role.DELIVERY: 'DELIVERY',
};
