// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationImpl _$$NotificationImplFromJson(Map<String, dynamic> json) =>
    _$NotificationImpl(
      title: json['title'] as String,
      content: json['content'] as String,
      images: json['images'] as String,
      topFixed: json['topFixed'] as bool,
      targets: json['targets'] as List<dynamic>,
    );

Map<String, dynamic> _$$NotificationImplToJson(_$NotificationImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'images': instance.images,
      'topFixed': instance.topFixed,
      'targets': instance.targets,
    };
