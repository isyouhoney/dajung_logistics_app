// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$notificationImpl _$$notificationImplFromJson(Map<String, dynamic> json) =>
    _$notificationImpl(
      title: json['title'] as String,
      content: json['content'] as String,
      images: json['images'] as String,
      topFixed: json['topFixed'] as String,
      targets: json['targets'] as String,
      writer: json['writer'] as String,
    );

Map<String, dynamic> _$$notificationImplToJson(_$notificationImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'images': instance.images,
      'topFixed': instance.topFixed,
      'targets': instance.targets,
      'writer': instance.writer,
    };
