import 'package:bakery_app/models/item.dart';
import 'package:bakery_app/models/order.dart';
import 'package:bakery_app/models/user.dart';
import 'package:bakery_app/utils/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'additional_request.freezed.dart';
part 'additional_request.g.dart';

@freezed
class AdditionalRequest with _$AdditionalRequest {
  const AdditionalRequest._();
  factory AdditionalRequest({
    required String itemName,
    required num price,
    required String image,
    required String description,
    required Item item,
    required int quantity,
    required String requestDate,
    required User request,
    required User accept,
    required Order order,
    required RequestStatus status,
}) = _AdditionalRequest;

  factory AdditionalRequest.fromJson(Map<String, dynamic> json) =>
      _$AdditionalRequestFromJson(json);
}