import 'package:bakery_app/models/item.dart';
import 'package:bakery_app/models/recall.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recall_item.freezed.dart';
part 'recall_item.g.dart';

@freezed
class RecallItem with _$RecallItem {
  const RecallItem._();
  factory RecallItem({
    required String itemName,
    required num price,
    required String image,
    required String description,
    required Item item,
    required Recall recall,
    required int quantity,
}) = _RecallItem;

  factory RecallItem.fromJson(Map<String, dynamic> json) =>
      _$RecallItemFromJson(json);
}