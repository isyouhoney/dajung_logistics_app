// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_targets.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemTargetsImpl _$$ItemTargetsImplFromJson(Map<String, dynamic> json) =>
    _$ItemTargetsImpl(
      target: $enumDecode(_$RoleEnumMap, json['target']),
      item: Item.fromJson(json['item'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ItemTargetsImplToJson(_$ItemTargetsImpl instance) =>
    <String, dynamic>{
      'target': _$RoleEnumMap[instance.target]!,
      'item': instance.item,
    };

const _$RoleEnumMap = {
  Role.MASTER: 'MASTER',
  Role.MAIN: 'MAIN',
  Role.DIRECT: 'DIRECT',
  Role.SUB: 'SUB',
  Role.DELIVERY: 'DELIVERY',
};
