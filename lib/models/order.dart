import 'package:bakery_app/models/additional_request.dart';
import 'package:bakery_app/models/order_sheet.dart';
import 'package:bakery_app/models/recall.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class Order with _$Order {
  const Order._();
  factory Order({
    required OrderSheet orderSheet,
    String? orderDate,
    List<String>? images,
    dynamic status,
    AdditionalRequest? additionalRequests,
    Recall? recall,
}) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) =>
      _$OrderFromJson(json);
}