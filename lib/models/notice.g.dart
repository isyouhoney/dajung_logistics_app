// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NoticeImpl _$$NoticeImplFromJson(Map<String, dynamic> json) => _$NoticeImpl(
      title: json['title'] as String,
      content: json['content'] as String,
      updatedAt: json['updatedAt'] as String?,
      images: json['images'] as String?,
      topFixed: json['topFixed'] as bool,
      targets: json['targets'] as List<dynamic>?,
      writer: json['writer'] == null
          ? null
          : User.fromJson(json['writer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$NoticeImplToJson(_$NoticeImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'updatedAt': instance.updatedAt,
      'images': instance.images,
      'topFixed': instance.topFixed,
      'targets': instance.targets,
      'writer': instance.writer,
    };
