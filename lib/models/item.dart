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
    required String itemName,
    required int price,
    required String images,
    required String description,
    required ItemCategory category,
    ItemStatus? status,
    User? owner,
    List<Role>? targets,
}) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) =>
      _$ItemFromJson(json);
}