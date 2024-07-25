import 'package:freezed_annotation/freezed_annotation.dart';

part 'recall.freezed.dart';
part 'recall.g.dart';

@freezed
class Recall with _$Recall {
  const Recall._();
  factory Recall({
    required String image,
    required bool storeOwnerCheck,
    required Recall recallItems,
}) = _Recall;

  factory Recall.fromJson(Map<String, dynamic> json) =>
      _$RecallFromJson(json);
}