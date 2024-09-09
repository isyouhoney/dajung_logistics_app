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
    int? id,
    String? orderDate,
    List<String>? images,
    String? note,
    dynamic status,
    required OrderSheet orderSheet,
    AdditionalRequest? additionalRequests,
    Recall? recall,
    int? yesterdayId,
}) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) =>
      _$OrderFromJson(json);
}