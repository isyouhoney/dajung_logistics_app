// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemImpl _$$ItemImplFromJson(Map<String, dynamic> json) => _$ItemImpl(
      id: (json['id'] as num?)?.toInt(),
      itemName: json['itemName'] as String,
      price: (json['price'] as num).toInt(),
      image: json['image'] as String,
      description: json['description'] as String,
      category: json['category'] == null
          ? null
          : ItemCategory.fromJson(json['category'] as Map<String, dynamic>),
      owner: json['owner'] == null
          ? null
          : User.fromJson(json['owner'] as Map<String, dynamic>),
      targets: (json['targets'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$RoleEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$$ItemImplToJson(_$ItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'itemName': instance.itemName,
      'price': instance.price,
      'image': instance.image,
      'description': instance.description,
      'category': instance.category,
      'owner': instance.owner,
      'targets': instance.targets?.map((e) => _$RoleEnumMap[e]!).toList(),
    };

const _$RoleEnumMap = {
  Role.MASTER: 'MASTER',
  Role.MAIN: 'MAIN',
  Role.DIRECT: 'DIRECT',
  Role.SUB: 'SUB',
  Role.DELIVERY: 'DELIVERY',
};
