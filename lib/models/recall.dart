import 'package:freezed_annotation/freezed_annotation.dart';

import 'order_item.dart';

part 'recall.freezed.dart';
part 'recall.g.dart';

@freezed
class Recall with _$Recall {
  const Recall._();
  factory Recall({
    required List<String> images,
    required List<OrderItem> recallItems,
}) = _Recall;

  factory Recall.fromJson(Map<String, dynamic> json) =>
      _$RecallFromJson(json);
}