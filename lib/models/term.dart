import 'package:bakery_app/utils/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'term.freezed.dart';
part 'term.g.dart';

@freezed
class Term with _$Term {
  const Term._();
  factory Term({
    required String title,
    required String content,
    required int id,
    List<Role>? targets,
}) = _Term;

  factory Term.fromJson(Map<String, dynamic> json) =>
      _$TermFromJson(json);
}