// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'term.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TermImpl _$$TermImplFromJson(Map<String, dynamic> json) => _$TermImpl(
      title: json['title'] as String,
      content: json['content'] as String,
      id: (json['id'] as num).toInt(),
      targets: (json['targets'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$RoleEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$$TermImplToJson(_$TermImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'id': instance.id,
      'targets': instance.targets?.map((e) => _$RoleEnumMap[e]!).toList(),
    };

const _$RoleEnumMap = {
  Role.MASTER: 'MASTER',
  Role.MAIN: 'MAIN',
  Role.DIRECT: 'DIRECT',
  Role.SUB: 'SUB',
  Role.DELIVERY: 'DELIVERY',
};
