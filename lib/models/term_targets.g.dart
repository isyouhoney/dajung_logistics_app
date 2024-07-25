// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'term_targets.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TermTargetsImpl _$$TermTargetsImplFromJson(Map<String, dynamic> json) =>
    _$TermTargetsImpl(
      target: $enumDecode(_$RoleEnumMap, json['target']),
      terms: (json['terms'] as List<dynamic>)
          .map((e) => Term.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TermTargetsImplToJson(_$TermTargetsImpl instance) =>
    <String, dynamic>{
      'target': _$RoleEnumMap[instance.target]!,
      'terms': instance.terms,
    };

const _$RoleEnumMap = {
  Role.MASTER: 'MASTER',
  Role.MAIN: 'MAIN',
  Role.DIRECT: 'DIRECT',
  Role.SUB: 'SUB',
  Role.DELIVERY: 'DELIVERY',
};
