import 'package:bakery_app/models/order_item.dart';
import 'package:bakery_app/models/user.dart';
import 'package:bakery_app/utils/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_sheet.freezed.dart';
part 'order_sheet.g.dart';

@freezed
class OrderSheet with _$OrderSheet {
  const OrderSheet._();
  factory OrderSheet({
    required DayOfWeek dayOfTheWeek,
    required bool activated,
    required User orderer,
    required List<OrderItem> orderItems,
    required String orders,
}) = _OrderSheet;

  factory OrderSheet.fromJson(Map<String, dynamic> json) =>
      _$OrderSheetFromJson(json);
}