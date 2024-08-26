import 'package:bakery_app/models/order_item.dart';
import 'package:bakery_app/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'additional_request.freezed.dart';
part 'additional_request.g.dart';

@freezed
class AdditionalRequest with _$AdditionalRequest {
  const AdditionalRequest._();
  factory AdditionalRequest({
    int? id,
    required OrderItem orderItem,
    required String requestDate,
    User? request,
    User? accept,
    dynamic status,
}) = _AdditionalRequest;

  factory AdditionalRequest.fromJson(Map<String, dynamic> json) =>
      _$AdditionalRequestFromJson(json);
}