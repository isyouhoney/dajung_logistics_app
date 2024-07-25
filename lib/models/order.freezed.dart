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
  Production get production => throw _privateConstructorUsedError;
  String get orderDate => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  OrderStatus get status => throw _privateConstructorUsedError;
  AdditionalRequest get additionalRequests =>
      throw _privateConstructorUsedError;
  Recall get recall => throw _privateConstructorUsedError;

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
      Production production,
      String orderDate,
      String image,
      OrderStatus status,
      AdditionalRequest additionalRequests,
      Recall recall});

  $OrderSheetCopyWith<$Res> get orderSheet;
  $ProductionCopyWith<$Res> get production;
  $AdditionalRequestCopyWith<$Res> get additionalRequests;
  $RecallCopyWith<$Res> get recall;
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
    Object? production = null,
    Object? orderDate = null,
    Object? image = null,
    Object? status = null,
    Object? additionalRequests = null,
    Object? recall = null,
  }) {
    return _then(_value.copyWith(
      orderSheet: null == orderSheet
          ? _value.orderSheet
          : orderSheet // ignore: cast_nullable_to_non_nullable
              as OrderSheet,
      production: null == production
          ? _value.production
          : production // ignore: cast_nullable_to_non_nullable
              as Production,
      orderDate: null == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
      additionalRequests: null == additionalRequests
          ? _value.additionalRequests
          : additionalRequests // ignore: cast_nullable_to_non_nullable
              as AdditionalRequest,
      recall: null == recall
          ? _value.recall
          : recall // ignore: cast_nullable_to_non_nullable
              as Recall,
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
  $ProductionCopyWith<$Res> get production {
    return $ProductionCopyWith<$Res>(_value.production, (value) {
      return _then(_value.copyWith(production: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AdditionalRequestCopyWith<$Res> get additionalRequests {
    return $AdditionalRequestCopyWith<$Res>(_value.additionalRequests, (value) {
      return _then(_value.copyWith(additionalRequests: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RecallCopyWith<$Res> get recall {
    return $RecallCopyWith<$Res>(_value.recall, (value) {
      return _then(_value.copyWith(recall: value) as $Val);
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
      Production production,
      String orderDate,
      String image,
      OrderStatus status,
      AdditionalRequest additionalRequests,
      Recall recall});

  @override
  $OrderSheetCopyWith<$Res> get orderSheet;
  @override
  $ProductionCopyWith<$Res> get production;
  @override
  $AdditionalRequestCopyWith<$Res> get additionalRequests;
  @override
  $RecallCopyWith<$Res> get recall;
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
    Object? production = null,
    Object? orderDate = null,
    Object? image = null,
    Object? status = null,
    Object? additionalRequests = null,
    Object? recall = null,
  }) {
    return _then(_$OrderImpl(
      orderSheet: null == orderSheet
          ? _value.orderSheet
          : orderSheet // ignore: cast_nullable_to_non_nullable
              as OrderSheet,
      production: null == production
          ? _value.production
          : production // ignore: cast_nullable_to_non_nullable
              as Production,
      orderDate: null == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
      additionalRequests: null == additionalRequests
          ? _value.additionalRequests
          : additionalRequests // ignore: cast_nullable_to_non_nullable
              as AdditionalRequest,
      recall: null == recall
          ? _value.recall
          : recall // ignore: cast_nullable_to_non_nullable
              as Recall,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderImpl extends _Order {
  _$OrderImpl(
      {required this.orderSheet,
      required this.production,
      required this.orderDate,
      required this.image,
      required this.status,
      required this.additionalRequests,
      required this.recall})
      : super._();

  factory _$OrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderImplFromJson(json);

  @override
  final OrderSheet orderSheet;
  @override
  final Production production;
  @override
  final String orderDate;
  @override
  final String image;
  @override
  final OrderStatus status;
  @override
  final AdditionalRequest additionalRequests;
  @override
  final Recall recall;

  @override
  String toString() {
    return 'Order(orderSheet: $orderSheet, production: $production, orderDate: $orderDate, image: $image, status: $status, additionalRequests: $additionalRequests, recall: $recall)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderImpl &&
            (identical(other.orderSheet, orderSheet) ||
                other.orderSheet == orderSheet) &&
            (identical(other.production, production) ||
                other.production == production) &&
            (identical(other.orderDate, orderDate) ||
                other.orderDate == orderDate) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.additionalRequests, additionalRequests) ||
                other.additionalRequests == additionalRequests) &&
            (identical(other.recall, recall) || other.recall == recall));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, orderSheet, production,
      orderDate, image, status, additionalRequests, recall);

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
      required final Production production,
      required final String orderDate,
      required final String image,
      required final OrderStatus status,
      required final AdditionalRequest additionalRequests,
      required final Recall recall}) = _$OrderImpl;
  _Order._() : super._();

  factory _Order.fromJson(Map<String, dynamic> json) = _$OrderImpl.fromJson;

  @override
  OrderSheet get orderSheet;
  @override
  Production get production;
  @override
  String get orderDate;
  @override
  String get image;
  @override
  OrderStatus get status;
  @override
  AdditionalRequest get additionalRequests;
  @override
  Recall get recall;
  @override
  @JsonKey(ignore: true)
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
