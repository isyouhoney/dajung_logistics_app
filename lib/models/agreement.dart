import 'package:bakery_app/models/term.dart';
import 'package:bakery_app/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'agreement.freezed.dart';
part 'agreement.g.dart';

@freezed
class Agreement with _$Agreement {
  const Agreement._();
  factory Agreement({
    required int termId,
    // required User user,
    required bool isAgree,
}) = _Agreement;

  factory Agreement.fromJson(Map<String, dynamic> json) =>
      _$AgreementFromJson(json);
}