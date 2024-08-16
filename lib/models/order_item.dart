import 'package:bakery_app/models/item.dart';
import 'package:bakery_app/models/order_sheet.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_item.freezed.dart';
part 'order_item.g.dart';

@freezed
class OrderItem with _$OrderItem {
  const OrderItem._();
  factory OrderItem({
    required Item item,
    required int quantity,
    OrderSheet? orderSheet,
}) = _OrderItem;

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);
}