// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Order _$OrderFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
mixin _$Order {
  OrderSheet get orderSheet => throw _privateConstructorUsedError;
  String get orderDate => throw _privateConstructorUsedError;
  List<String>? get image => throw _privateConstructorUsedError;
  dynamic get status => throw _privateConstructorUsedError;
  AdditionalRequest? get additionalRequests =>
      throw _privateConstructorUsedError;
  List<OrderItem>? get recall => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderCopyWith<Order> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res, Order>;
  @useResult
  $Res call(
      {OrderSheet orderSheet,
      String orderDate,
      List<String>? image,
      dynamic status,
      AdditionalRequest? additionalRequests,
      List<OrderItem>? recall});

  $OrderSheetCopyWith<$Res> get orderSheet;
  $AdditionalRequestCopyWith<$Res>? get additionalRequests;
}

/// @nodoc
class _$OrderCopyWithImpl<$Res, $Val extends Order>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderSheet = null,
    Object? orderDate = null,
    Object? image = freezed,
    Object? status = freezed,
    Object? additionalRequests = freezed,
    Object? recall = freezed,
  }) {
    return _then(_value.copyWith(
      orderSheet: null == orderSheet
          ? _value.orderSheet
          : orderSheet // ignore: cast_nullable_to_non_nullable
              as OrderSheet,
      orderDate: null == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as dynamic,
      additionalRequests: freezed == additionalRequests
          ? _value.additionalRequests
          : additionalRequests // ignore: cast_nullable_to_non_nullable
              as AdditionalRequest?,
      recall: freezed == recall
          ? _value.recall
          : recall // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderSheetCopyWith<$Res> get orderSheet {
    return $OrderSheetCopyWith<$Res>(_value.orderSheet, (value) {
      return _then(_value.copyWith(orderSheet: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AdditionalRequestCopyWith<$Res>? get additionalRequests {
    if (_value.additionalRequests == null) {
      return null;
    }

    return $AdditionalRequestCopyWith<$Res>(_value.additionalRequests!,
        (value) {
      return _then(_value.copyWith(additionalRequests: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderImplCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$$OrderImplCopyWith(
          _$OrderImpl value, $Res Function(_$OrderImpl) then) =
      __$$OrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {OrderSheet orderSheet,
      String orderDate,
      List<String>? image,
      dynamic status,
      AdditionalRequest? additionalRequests,
      List<OrderItem>? recall});

  @override
  $OrderSheetCopyWith<$Res> get orderSheet;
  @override
  $AdditionalRequestCopyWith<$Res>? get additionalRequests;
}

/// @nodoc
class __$$OrderImplCopyWithImpl<$Res>
    extends _$OrderCopyWithImpl<$Res, _$OrderImpl>
    implements _$$OrderImplCopyWith<$Res> {
  __$$OrderImplCopyWithImpl(
      _$OrderImpl _value, $Res Function(_$OrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderSheet = null,
    Object? orderDate = null,
    Object? image = freezed,
    Object? status = freezed,
    Object? additionalRequests = freezed,
    Object? recall = freezed,
  }) {
    return _then(_$OrderImpl(
      orderSheet: null == orderSheet
          ? _value.orderSheet
          : orderSheet // ignore: cast_nullable_to_non_nullable
              as OrderSheet,
      orderDate: null == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value._image
          : image // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as dynamic,
      additionalRequests: freezed == additionalRequests
          ? _value.additionalRequests
          : additionalRequests // ignore: cast_nullable_to_non_nullable
              as AdditionalRequest?,
      recall: freezed == recall
          ? _value._recall
          : recall // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderImpl extends _Order {
  _$OrderImpl(
      {required this.orderSheet,
      required this.orderDate,
      final List<String>? image,
      required this.status,
      this.additionalRequests,
      final List<OrderItem>? recall})
      : _image = image,
        _recall = recall,
        super._();

  factory _$OrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderImplFromJson(json);

  @override
  final OrderSheet orderSheet;
  @override
  final String orderDate;
  final List<String>? _image;
  @override
  List<String>? get image {
    final value = _image;
    if (value == null) return null;
    if (_image is EqualUnmodifiableListView) return _image;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final dynamic status;
  @override
  final AdditionalRequest? additionalRequests;
  final List<OrderItem>? _recall;
  @override
  List<OrderItem>? get recall {
    final value = _recall;
    if (value == null) return null;
    if (_recall is EqualUnmodifiableListView) return _recall;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Order(orderSheet: $orderSheet, orderDate: $orderDate, image: $image, status: $status, additionalRequests: $additionalRequests, recall: $recall)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderImpl &&
            (identical(other.orderSheet, orderSheet) ||
                other.orderSheet == orderSheet) &&
            (identical(other.orderDate, orderDate) ||
                other.orderDate == orderDate) &&
            const DeepCollectionEquality().equals(other._image, _image) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            (identical(other.additionalRequests, additionalRequests) ||
                other.additionalRequests == additionalRequests) &&
            const DeepCollectionEquality().equals(other._recall, _recall));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      orderSheet,
      orderDate,
      const DeepCollectionEquality().hash(_image),
      const DeepCollectionEquality().hash(status),
      additionalRequests,
      const DeepCollectionEquality().hash(_recall));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      __$$OrderImplCopyWithImpl<_$OrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderImplToJson(
      this,
    );
  }
}

abstract class _Order extends Order {
  factory _Order(
      {required final OrderSheet orderSheet,
      required final String orderDate,
      final List<String>? image,
      required final dynamic status,
      final AdditionalRequest? additionalRequests,
      final List<OrderItem>? recall}) = _$OrderImpl;
  _Order._() : super._();

  factory _Order.fromJson(Map<String, dynamic> json) = _$OrderImpl.fromJson;

  @override
  OrderSheet get orderSheet;
  @override
  String get orderDate;
  @override
  List<String>? get image;
  @override
  dynamic get status;
  @override
  AdditionalRequest? get additionalRequests;
  @override
  List<OrderItem>? get recall;
  @override
  @JsonKey(ignore: true)
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
