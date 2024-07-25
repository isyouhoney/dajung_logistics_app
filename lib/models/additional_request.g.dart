// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'additional_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdditionalRequestImpl _$$AdditionalRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$AdditionalRequestImpl(
      itemName: json['itemName'] as String,
      price: json['price'] as num,
      image: json['image'] as String,
      description: json['description'] as String,
      item: Item.fromJson(json['item'] as Map<String, dynamic>),
      quantity: (json['quantity'] as num).toInt(),
      requestDate: json['requestDate'] as String,
      request: User.fromJson(json['request'] as Map<String, dynamic>),
      accept: User.fromJson(json['accept'] as Map<String, dynamic>),
      order: Order.fromJson(json['order'] as Map<String, dynamic>),
      status: $enumDecode(_$RequestStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$AdditionalRequestImplToJson(
        _$AdditionalRequestImpl instance) =>
    <String, dynamic>{
      'itemName': instance.itemName,
      'price': instance.price,
      'image': instance.image,
      'description': instance.description,
      'item': instance.item,
      'quantity': instance.quantity,
      'requestDate': instance.requestDate,
      'request': instance.request,
      'accept': instance.accept,
      'order': instance.order,
      'status': _$RequestStatusEnumMap[instance.status]!,
    };

const _$RequestStatusEnumMap = {
  RequestStatus.requested: 'requested',
  RequestStatus.requestCanceled: 'requestCanceled',
  RequestStatus.requestAccepted: 'requestAccepted',
  RequestStatus.delivering: 'delivering',
  RequestStatus.delivered: 'delivered',
};
