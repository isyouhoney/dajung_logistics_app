import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

@freezed
class notification with _$notification {
  const notification._();
  factory notification({
    required String title,
    required String content,
    required String images,
    required String topFixed,
    required String targets,
    required String writer,
}) = _notification;

  factory notification.fromJson(Map<String, dynamic> json) =>
      _$notificationFromJson(json);
}