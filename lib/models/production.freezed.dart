// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'production.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Production _$ProductionFromJson(Map<String, dynamic> json) {
  return _Production.fromJson(json);
}

/// @nodoc
mixin _$Production {
  String get productionDate => throw _privateConstructorUsedError;
  Order get orders => throw _privateConstructorUsedError;
  String get mainStore => throw _privateConstructorUsedError;
  String get products => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductionCopyWith<Production> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductionCopyWith<$Res> {
  factory $ProductionCopyWith(
          Production value, $Res Function(Production) then) =
      _$ProductionCopyWithImpl<$Res, Production>;
  @useResult
  $Res call(
      {String productionDate, Order orders, String mainStore, String products});

  $OrderCopyWith<$Res> get orders;
}

/// @nodoc
class _$ProductionCopyWithImpl<$Res, $Val extends Production>
    implements $ProductionCopyWith<$Res> {
  _$ProductionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productionDate = null,
    Object? orders = null,
    Object? mainStore = null,
    Object? products = null,
  }) {
    return _then(_value.copyWith(
      productionDate: null == productionDate
          ? _value.productionDate
          : productionDate // ignore: cast_nullable_to_non_nullable
              as String,
      orders: null == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as Order,
      mainStore: null == mainStore
          ? _value.mainStore
          : mainStore // ignore: cast_nullable_to_non_nullable
              as String,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderCopyWith<$Res> get orders {
    return $OrderCopyWith<$Res>(_value.orders, (value) {
      return _then(_value.copyWith(orders: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductionImplCopyWith<$Res>
    implements $ProductionCopyWith<$Res> {
  factory _$$ProductionImplCopyWith(
          _$ProductionImpl value, $Res Function(_$ProductionImpl) then) =
      __$$ProductionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String productionDate, Order orders, String mainStore, String products});

  @override
  $OrderCopyWith<$Res> get orders;
}

/// @nodoc
class __$$ProductionImplCopyWithImpl<$Res>
    extends _$ProductionCopyWithImpl<$Res, _$ProductionImpl>
    implements _$$ProductionImplCopyWith<$Res> {
  __$$ProductionImplCopyWithImpl(
      _$ProductionImpl _value, $Res Function(_$ProductionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productionDate = null,
    Object? orders = null,
    Object? mainStore = null,
    Object? products = null,
  }) {
    return _then(_$ProductionImpl(
      productionDate: null == productionDate
          ? _value.productionDate
          : productionDate // ignore: cast_nullable_to_non_nullable
              as String,
      orders: null == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as Order,
      mainStore: null == mainStore
          ? _value.mainStore
          : mainStore // ignore: cast_nullable_to_non_nullable
              as String,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductionImpl extends _Production {
  _$ProductionImpl(
      {required this.productionDate,
      required this.orders,
      required this.mainStore,
      required this.products})
      : super._();

  factory _$ProductionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductionImplFromJson(json);

  @override
  final String productionDate;
  @override
  final Order orders;
  @override
  final String mainStore;
  @override
  final String products;

  @override
  String toString() {
    return 'Production(productionDate: $productionDate, orders: $orders, mainStore: $mainStore, products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductionImpl &&
            (identical(other.productionDate, productionDate) ||
                other.productionDate == productionDate) &&
            (identical(other.orders, orders) || other.orders == orders) &&
            (identical(other.mainStore, mainStore) ||
                other.mainStore == mainStore) &&
            (identical(other.products, products) ||
                other.products == products));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, productionDate, orders, mainStore, products);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductionImplCopyWith<_$ProductionImpl> get copyWith =>
      __$$ProductionImplCopyWithImpl<_$ProductionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductionImplToJson(
      this,
    );
  }
}

abstract class _Production extends Production {
  factory _Production(
      {required final String productionDate,
      required final Order orders,
      required final String mainStore,
      required final String products}) = _$ProductionImpl;
  _Production._() : super._();

  factory _Production.fromJson(Map<String, dynamic> json) =
      _$ProductionImpl.fromJson;

  @override
  String get productionDate;
  @override
  Order get orders;
  @override
  String get mainStore;
  @override
  String get products;
  @override
  @JsonKey(ignore: true)
  _$$ProductionImplCopyWith<_$ProductionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
