import 'package:bakery_app/models/order.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'production.freezed.dart';
part 'production.g.dart';

@freezed
class Production with _$Production {
  const Production._();
  factory Production({
    required String productionDate,
    required Order orders,
    required String mainStore,
    required String products,
}) = _Production;

  factory Production.fromJson(Map<String, dynamic> json) =>
      _$ProductionFromJson(json);
}