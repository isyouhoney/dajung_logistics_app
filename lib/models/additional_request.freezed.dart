// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'additional_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AdditionalRequest _$AdditionalRequestFromJson(Map<String, dynamic> json) {
  return _AdditionalRequest.fromJson(json);
}

/// @nodoc
mixin _$AdditionalRequest {
  String get itemName => throw _privateConstructorUsedError;
  num get price => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  Item get item => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  String get requestDate => throw _privateConstructorUsedError;
  User get request => throw _privateConstructorUsedError;
  User get accept => throw _privateConstructorUsedError;
  Order get order => throw _privateConstructorUsedError;
  RequestStatus get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdditionalRequestCopyWith<AdditionalRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdditionalRequestCopyWith<$Res> {
  factory $AdditionalRequestCopyWith(
          AdditionalRequest value, $Res Function(AdditionalRequest) then) =
      _$AdditionalRequestCopyWithImpl<$Res, AdditionalRequest>;
  @useResult
  $Res call(
      {String itemName,
      num price,
      String image,
      String description,
      Item item,
      int quantity,
      String requestDate,
      User request,
      User accept,
      Order order,
      RequestStatus status});

  $ItemCopyWith<$Res> get item;
  $UserCopyWith<$Res> get request;
  $UserCopyWith<$Res> get accept;
  $OrderCopyWith<$Res> get order;
}

/// @nodoc
class _$AdditionalRequestCopyWithImpl<$Res, $Val extends AdditionalRequest>
    implements $AdditionalRequestCopyWith<$Res> {
  _$AdditionalRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemName = null,
    Object? price = null,
    Object? image = null,
    Object? description = null,
    Object? item = null,
    Object? quantity = null,
    Object? requestDate = null,
    Object? request = null,
    Object? accept = null,
    Object? order = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      itemName: null == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as num,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as Item,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      requestDate: null == requestDate
          ? _value.requestDate
          : requestDate // ignore: cast_nullable_to_non_nullable
              as String,
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as User,
      accept: null == accept
          ? _value.accept
          : accept // ignore: cast_nullable_to_non_nullable
              as User,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as Order,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RequestStatus,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ItemCopyWith<$Res> get item {
    return $ItemCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get request {
    return $UserCopyWith<$Res>(_value.request, (value) {
      return _then(_value.copyWith(request: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get accept {
    return $UserCopyWith<$Res>(_value.accept, (value) {
      return _then(_value.copyWith(accept: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderCopyWith<$Res> get order {
    return $OrderCopyWith<$Res>(_value.order, (value) {
      return _then(_value.copyWith(order: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AdditionalRequestImplCopyWith<$Res>
    implements $AdditionalRequestCopyWith<$Res> {
  factory _$$AdditionalRequestImplCopyWith(_$AdditionalRequestImpl value,
          $Res Function(_$AdditionalRequestImpl) then) =
      __$$AdditionalRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String itemName,
      num price,
      String image,
      String description,
      Item item,
      int quantity,
      String requestDate,
      User request,
      User accept,
      Order order,
      RequestStatus status});

  @override
  $ItemCopyWith<$Res> get item;
  @override
  $UserCopyWith<$Res> get request;
  @override
  $UserCopyWith<$Res> get accept;
  @override
  $OrderCopyWith<$Res> get order;
}

/// @nodoc
class __$$AdditionalRequestImplCopyWithImpl<$Res>
    extends _$AdditionalRequestCopyWithImpl<$Res, _$AdditionalRequestImpl>
    implements _$$AdditionalRequestImplCopyWith<$Res> {
  __$$AdditionalRequestImplCopyWithImpl(_$AdditionalRequestImpl _value,
      $Res Function(_$AdditionalRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemName = null,
    Object? price = null,
    Object? image = null,
    Object? description = null,
    Object? item = null,
    Object? quantity = null,
    Object? requestDate = null,
    Object? request = null,
    Object? accept = null,
    Object? order = null,
    Object? status = null,
  }) {
    return _then(_$AdditionalRequestImpl(
      itemName: null == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as num,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as Item,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      requestDate: null == requestDate
          ? _value.requestDate
          : requestDate // ignore: cast_nullable_to_non_nullable
              as String,
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as User,
      accept: null == accept
          ? _value.accept
          : accept // ignore: cast_nullable_to_non_nullable
              as User,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as Order,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RequestStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdditionalRequestImpl extends _AdditionalRequest {
  _$AdditionalRequestImpl(
      {required this.itemName,
      required this.price,
      required this.image,
      required this.description,
      required this.item,
      required this.quantity,
      required this.requestDate,
      required this.request,
      required this.accept,
      required this.order,
      required this.status})
      : super._();

  factory _$AdditionalRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdditionalRequestImplFromJson(json);

  @override
  final String itemName;
  @override
  final num price;
  @override
  final String image;
  @override
  final String description;
  @override
  final Item item;
  @override
  final int quantity;
  @override
  final String requestDate;
  @override
  final User request;
  @override
  final User accept;
  @override
  final Order order;
  @override
  final RequestStatus status;

  @override
  String toString() {
    return 'AdditionalRequest(itemName: $itemName, price: $price, image: $image, description: $description, item: $item, quantity: $quantity, requestDate: $requestDate, request: $request, accept: $accept, order: $order, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdditionalRequestImpl &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.requestDate, requestDate) ||
                other.requestDate == requestDate) &&
            (identical(other.request, request) || other.request == request) &&
            (identical(other.accept, accept) || other.accept == accept) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, itemName, price, image,
      description, item, quantity, requestDate, request, accept, order, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AdditionalRequestImplCopyWith<_$AdditionalRequestImpl> get copyWith =>
      __$$AdditionalRequestImplCopyWithImpl<_$AdditionalRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdditionalRequestImplToJson(
      this,
    );
  }
}

abstract class _AdditionalRequest extends AdditionalRequest {
  factory _AdditionalRequest(
      {required final String itemName,
      required final num price,
      required final String image,
      required final String description,
      required final Item item,
      required final int quantity,
      required final String requestDate,
      required final User request,
      required final User accept,
      required final Order order,
      required final RequestStatus status}) = _$AdditionalRequestImpl;
  _AdditionalRequest._() : super._();

  factory _AdditionalRequest.fromJson(Map<String, dynamic> json) =
      _$AdditionalRequestImpl.fromJson;

  @override
  String get itemName;
  @override
  num get price;
  @override
  String get image;
  @override
  String get description;
  @override
  Item get item;
  @override
  int get quantity;
  @override
  String get requestDate;
  @override
  User get request;
  @override
  User get accept;
  @override
  Order get order;
  @override
  RequestStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$AdditionalRequestImplCopyWith<_$AdditionalRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
