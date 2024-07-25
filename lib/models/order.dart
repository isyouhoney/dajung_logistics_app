import 'package:bakery_app/models/additional_request.dart';
import 'package:bakery_app/models/order_sheet.dart';
import 'package:bakery_app/models/production.dart';
import 'package:bakery_app/models/recall.dart';
import 'package:bakery_app/utils/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class Order with _$Order {
  const Order._();
  factory Order({
    required OrderSheet orderSheet,
    required Production production,
    required String orderDate,
    required String image,
    required OrderStatus status,
    required AdditionalRequest additionalRequests,
    required Recall recall,
}) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) =>
      _$OrderFromJson(json);
}