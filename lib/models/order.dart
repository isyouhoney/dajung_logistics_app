import 'package:bakery_app/models/additional_request.dart';
import 'package:bakery_app/models/order_item.dart';
import 'package:bakery_app/models/order_sheet.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class Order with _$Order {
  const Order._();
  factory Order({
    required OrderSheet orderSheet,
    required String orderDate,
    List<String>? image,
    required dynamic status,
    AdditionalRequest? additionalRequests,
    List<OrderItem>? recall,
}) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) =>
      _$OrderFromJson(json);
}