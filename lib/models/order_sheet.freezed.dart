// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_sheet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderSheet _$OrderSheetFromJson(Map<String, dynamic> json) {
  return _OrderSheet.fromJson(json);
}

/// @nodoc
mixin _$OrderSheet {
  int? get id => throw _privateConstructorUsedError;
  dynamic get dayOfTheWeek => throw _privateConstructorUsedError;
  bool? get activated => throw _privateConstructorUsedError;
  User? get orderer => throw _privateConstructorUsedError;
  List<OrderItem> get orderItems => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderSheetCopyWith<OrderSheet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderSheetCopyWith<$Res> {
  factory $OrderSheetCopyWith(
          OrderSheet value, $Res Function(OrderSheet) then) =
      _$OrderSheetCopyWithImpl<$Res, OrderSheet>;
  @useResult
  $Res call(
      {int? id,
      dynamic dayOfTheWeek,
      bool? activated,
      User? orderer,
      List<OrderItem> orderItems});

  $UserCopyWith<$Res>? get orderer;
}

/// @nodoc
class _$OrderSheetCopyWithImpl<$Res, $Val extends OrderSheet>
    implements $OrderSheetCopyWith<$Res> {
  _$OrderSheetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? dayOfTheWeek = freezed,
    Object? activated = freezed,
    Object? orderer = freezed,
    Object? orderItems = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      dayOfTheWeek: freezed == dayOfTheWeek
          ? _value.dayOfTheWeek
          : dayOfTheWeek // ignore: cast_nullable_to_non_nullable
              as dynamic,
      activated: freezed == activated
          ? _value.activated
          : activated // ignore: cast_nullable_to_non_nullable
              as bool?,
      orderer: freezed == orderer
          ? _value.orderer
          : orderer // ignore: cast_nullable_to_non_nullable
              as User?,
      orderItems: null == orderItems
          ? _value.orderItems
          : orderItems // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get orderer {
    if (_value.orderer == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.orderer!, (value) {
      return _then(_value.copyWith(orderer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderSheetImplCopyWith<$Res>
    implements $OrderSheetCopyWith<$Res> {
  factory _$$OrderSheetImplCopyWith(
          _$OrderSheetImpl value, $Res Function(_$OrderSheetImpl) then) =
      __$$OrderSheetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      dynamic dayOfTheWeek,
      bool? activated,
      User? orderer,
      List<OrderItem> orderItems});

  @override
  $UserCopyWith<$Res>? get orderer;
}

/// @nodoc
class __$$OrderSheetImplCopyWithImpl<$Res>
    extends _$OrderSheetCopyWithImpl<$Res, _$OrderSheetImpl>
    implements _$$OrderSheetImplCopyWith<$Res> {
  __$$OrderSheetImplCopyWithImpl(
      _$OrderSheetImpl _value, $Res Function(_$OrderSheetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? dayOfTheWeek = freezed,
    Object? activated = freezed,
    Object? orderer = freezed,
    Object? orderItems = null,
  }) {
    return _then(_$OrderSheetImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      dayOfTheWeek: freezed == dayOfTheWeek
          ? _value.dayOfTheWeek
          : dayOfTheWeek // ignore: cast_nullable_to_non_nullable
              as dynamic,
      activated: freezed == activated
          ? _value.activated
          : activated // ignore: cast_nullable_to_non_nullable
              as bool?,
      orderer: freezed == orderer
          ? _value.orderer
          : orderer // ignore: cast_nullable_to_non_nullable
              as User?,
      orderItems: null == orderItems
          ? _value._orderItems
          : orderItems // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderSheetImpl extends _OrderSheet {
  _$OrderSheetImpl(
      {this.id,
      required this.dayOfTheWeek,
      this.activated,
      this.orderer,
      required final List<OrderItem> orderItems})
      : _orderItems = orderItems,
        super._();

  factory _$OrderSheetImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderSheetImplFromJson(json);

  @override
  final int? id;
  @override
  final dynamic dayOfTheWeek;
  @override
  final bool? activated;
  @override
  final User? orderer;
  final List<OrderItem> _orderItems;
  @override
  List<OrderItem> get orderItems {
    if (_orderItems is EqualUnmodifiableListView) return _orderItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderItems);
  }

  @override
  String toString() {
    return 'OrderSheet(id: $id, dayOfTheWeek: $dayOfTheWeek, activated: $activated, orderer: $orderer, orderItems: $orderItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderSheetImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other.dayOfTheWeek, dayOfTheWeek) &&
            (identical(other.activated, activated) ||
                other.activated == activated) &&
            (identical(other.orderer, orderer) || other.orderer == orderer) &&
            const DeepCollectionEquality()
                .equals(other._orderItems, _orderItems));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(dayOfTheWeek),
      activated,
      orderer,
      const DeepCollectionEquality().hash(_orderItems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderSheetImplCopyWith<_$OrderSheetImpl> get copyWith =>
      __$$OrderSheetImplCopyWithImpl<_$OrderSheetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderSheetImplToJson(
      this,
    );
  }
}

abstract class _OrderSheet extends OrderSheet {
  factory _OrderSheet(
      {final int? id,
      required final dynamic dayOfTheWeek,
      final bool? activated,
      final User? orderer,
      required final List<OrderItem> orderItems}) = _$OrderSheetImpl;
  _OrderSheet._() : super._();

  factory _OrderSheet.fromJson(Map<String, dynamic> json) =
      _$OrderSheetImpl.fromJson;

  @override
  int? get id;
  @override
  dynamic get dayOfTheWeek;
  @override
  bool? get activated;
  @override
  User? get orderer;
  @override
  List<OrderItem> get orderItems;
  @override
  @JsonKey(ignore: true)
  _$$OrderSheetImplCopyWith<_$OrderSheetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
