import 'package:bakery_app/models/term.dart';
import 'package:bakery_app/utils/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'term_targets.freezed.dart';
part 'term_targets.g.dart';

@freezed
class TermTargets with _$TermTargets{
  const TermTargets._();
  factory TermTargets({
    required Role target,
    required List<Term> terms,
}) = _TermTargets;

  factory TermTargets.fromJson(Map<String, dynamic> json) =>
      _$TermTargetsFromJson(json);
}