import 'package:bakery_app/models/item.dart';
import 'package:bakery_app/utils/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_targets.freezed.dart';
part 'item_targets.g.dart';

@freezed
class ItemTargets with _$ItemTargets {
  const ItemTargets._();
  factory ItemTargets({
    required Role target,
    required Item item,
}) = _ItemTargets;

  factory ItemTargets.fromJson(Map<String, dynamic> json) =>
      _$ItemTargetsFromJson(json);
}