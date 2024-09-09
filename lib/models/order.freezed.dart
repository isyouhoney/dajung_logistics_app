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
  int? get id => throw _privateConstructorUsedError;
  String? get orderDate => throw _privateConstructorUsedError;
  List<String>? get images => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  dynamic get status => throw _privateConstructorUsedError;
  OrderSheet get orderSheet => throw _privateConstructorUsedError;
  AdditionalRequest? get additionalRequests =>
      throw _privateConstructorUsedError;
  Recall? get recall => throw _privateConstructorUsedError;
  int? get yesterdayId => throw _privateConstructorUsedError;

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
      {int? id,
      String? orderDate,
      List<String>? images,
      String? note,
      dynamic status,
      OrderSheet orderSheet,
      AdditionalRequest? additionalRequests,
      Recall? recall,
      int? yesterdayId});

  $OrderSheetCopyWith<$Res> get orderSheet;
  $AdditionalRequestCopyWith<$Res>? get additionalRequests;
  $RecallCopyWith<$Res>? get recall;
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
    Object? id = freezed,
    Object? orderDate = freezed,
    Object? images = freezed,
    Object? note = freezed,
    Object? status = freezed,
    Object? orderSheet = null,
    Object? additionalRequests = freezed,
    Object? recall = freezed,
    Object? yesterdayId = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      orderDate: freezed == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as dynamic,
      orderSheet: null == orderSheet
          ? _value.orderSheet
          : orderSheet // ignore: cast_nullable_to_non_nullable
              as OrderSheet,
      additionalRequests: freezed == additionalRequests
          ? _value.additionalRequests
          : additionalRequests // ignore: cast_nullable_to_non_nullable
              as AdditionalRequest?,
      recall: freezed == recall
          ? _value.recall
          : recall // ignore: cast_nullable_to_non_nullable
              as Recall?,
      yesterdayId: freezed == yesterdayId
          ? _value.yesterdayId
          : yesterdayId // ignore: cast_nullable_to_non_nullable
              as int?,
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

  @override
  @pragma('vm:prefer-inline')
  $RecallCopyWith<$Res>? get recall {
    if (_value.recall == null) {
      return null;
    }

    return $RecallCopyWith<$Res>(_value.recall!, (value) {
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
      {int? id,
      String? orderDate,
      List<String>? images,
      String? note,
      dynamic status,
      OrderSheet orderSheet,
      AdditionalRequest? additionalRequests,
      Recall? recall,
      int? yesterdayId});

  @override
  $OrderSheetCopyWith<$Res> get orderSheet;
  @override
  $AdditionalRequestCopyWith<$Res>? get additionalRequests;
  @override
  $RecallCopyWith<$Res>? get recall;
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
    Object? id = freezed,
    Object? orderDate = freezed,
    Object? images = freezed,
    Object? note = freezed,
    Object? status = freezed,
    Object? orderSheet = null,
    Object? additionalRequests = freezed,
    Object? recall = freezed,
    Object? yesterdayId = freezed,
  }) {
    return _then(_$OrderImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      orderDate: freezed == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as dynamic,
      orderSheet: null == orderSheet
          ? _value.orderSheet
          : orderSheet // ignore: cast_nullable_to_non_nullable
              as OrderSheet,
      additionalRequests: freezed == additionalRequests
          ? _value.additionalRequests
          : additionalRequests // ignore: cast_nullable_to_non_nullable
              as AdditionalRequest?,
      recall: freezed == recall
          ? _value.recall
          : recall // ignore: cast_nullable_to_non_nullable
              as Recall?,
      yesterdayId: freezed == yesterdayId
          ? _value.yesterdayId
          : yesterdayId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderImpl extends _Order {
  _$OrderImpl(
      {this.id,
      this.orderDate,
      final List<String>? images,
      this.note,
      this.status,
      required this.orderSheet,
      this.additionalRequests,
      this.recall,
      this.yesterdayId})
      : _images = images,
        super._();

  factory _$OrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderImplFromJson(json);

  @override
  final int? id;
  @override
  final String? orderDate;
  final List<String>? _images;
  @override
  List<String>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? note;
  @override
  final dynamic status;
  @override
  final OrderSheet orderSheet;
  @override
  final AdditionalRequest? additionalRequests;
  @override
  final Recall? recall;
  @override
  final int? yesterdayId;

  @override
  String toString() {
    return 'Order(id: $id, orderDate: $orderDate, images: $images, note: $note, status: $status, orderSheet: $orderSheet, additionalRequests: $additionalRequests, recall: $recall, yesterdayId: $yesterdayId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderDate, orderDate) ||
                other.orderDate == orderDate) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.note, note) || other.note == note) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            (identical(other.orderSheet, orderSheet) ||
                other.orderSheet == orderSheet) &&
            (identical(other.additionalRequests, additionalRequests) ||
                other.additionalRequests == additionalRequests) &&
            (identical(other.recall, recall) || other.recall == recall) &&
            (identical(other.yesterdayId, yesterdayId) ||
                other.yesterdayId == yesterdayId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      orderDate,
      const DeepCollectionEquality().hash(_images),
      note,
      const DeepCollectionEquality().hash(status),
      orderSheet,
      additionalRequests,
      recall,
      yesterdayId);

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
      {final int? id,
      final String? orderDate,
      final List<String>? images,
      final String? note,
      final dynamic status,
      required final OrderSheet orderSheet,
      final AdditionalRequest? additionalRequests,
      final Recall? recall,
      final int? yesterdayId}) = _$OrderImpl;
  _Order._() : super._();

  factory _Order.fromJson(Map<String, dynamic> json) = _$OrderImpl.fromJson;

  @override
  int? get id;
  @override
  String? get orderDate;
  @override
  List<String>? get images;
  @override
  String? get note;
  @override
  dynamic get status;
  @override
  OrderSheet get orderSheet;
  @override
  AdditionalRequest? get additionalRequests;
  @override
  Recall? get recall;
  @override
  int? get yesterdayId;
  @override
  @JsonKey(ignore: true)
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
