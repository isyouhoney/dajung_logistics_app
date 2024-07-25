import 'package:bakery_app/models/item.dart';
import 'package:bakery_app/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_category.freezed.dart';
part 'item_category.g.dart';

@freezed
class ItemCategory with _$ItemCategory {
  const ItemCategory._();
  factory ItemCategory({
    required String categoryName,
    required User mainStore,
    required Item items,
}) = _ItemCategory;

  factory ItemCategory.fromJson(Map<String, dynamic> json) =>
      _$ItemCategoryFromJson(json);
}