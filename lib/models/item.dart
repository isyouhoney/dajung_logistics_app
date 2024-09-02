import 'package:bakery_app/models/item_category.dart';
import 'package:bakery_app/models/user.dart';
import 'package:bakery_app/utils/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'item.freezed.dart';
part 'item.g.dart';

@freezed
class Item with _$Item {
  const Item._();
  factory Item({
    int? id,
    required String itemName,
    required int price,
    required String image,
    required String description,
    required ItemCategory category,
    User? owner,
    List<Role>? targets,
    dynamic status,
}) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) =>
      _$ItemFromJson(json);
}