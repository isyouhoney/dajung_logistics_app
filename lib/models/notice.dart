import 'package:bakery_app/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notice.freezed.dart';
part 'notice.g.dart';

@freezed
class Notice with _$Notice {
  const Notice._();
  factory Notice({
    required String title,
    required String content,
    String? updatedAt,
    String? images,
    required bool topFixed,
    List? targets,
    User? writer,
}) = _Notice;

  factory Notice.fromJson(Map<String, dynamic> json) =>
      _$NoticeFromJson(json);
}