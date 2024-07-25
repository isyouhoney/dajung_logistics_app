// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recall_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RecallItem _$RecallItemFromJson(Map<String, dynamic> json) {
  return _RecallItem.fromJson(json);
}

/// @nodoc
mixin _$RecallItem {
  String get itemName => throw _privateConstructorUsedError;
  num get price => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  Item get item => throw _privateConstructorUsedError;
  Recall get recall => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecallItemCopyWith<RecallItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecallItemCopyWith<$Res> {
  factory $RecallItemCopyWith(
          RecallItem value, $Res Function(RecallItem) then) =
      _$RecallItemCopyWithImpl<$Res, RecallItem>;
  @useResult
  $Res call(
      {String itemName,
      num price,
      String image,
      String description,
      Item item,
      Recall recall,
      int quantity});

  $ItemCopyWith<$Res> get item;
  $RecallCopyWith<$Res> get recall;
}

/// @nodoc
class _$RecallItemCopyWithImpl<$Res, $Val extends RecallItem>
    implements $RecallItemCopyWith<$Res> {
  _$RecallItemCopyWithImpl(this._value, this._then);

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
    Object? recall = null,
    Object? quantity = null,
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
      recall: null == recall
          ? _value.recall
          : recall // ignore: cast_nullable_to_non_nullable
              as Recall,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
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
  $RecallCopyWith<$Res> get recall {
    return $RecallCopyWith<$Res>(_value.recall, (value) {
      return _then(_value.copyWith(recall: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RecallItemImplCopyWith<$Res>
    implements $RecallItemCopyWith<$Res> {
  factory _$$RecallItemImplCopyWith(
          _$RecallItemImpl value, $Res Function(_$RecallItemImpl) then) =
      __$$RecallItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String itemName,
      num price,
      String image,
      String description,
      Item item,
      Recall recall,
      int quantity});

  @override
  $ItemCopyWith<$Res> get item;
  @override
  $RecallCopyWith<$Res> get recall;
}

/// @nodoc
class __$$RecallItemImplCopyWithImpl<$Res>
    extends _$RecallItemCopyWithImpl<$Res, _$RecallItemImpl>
    implements _$$RecallItemImplCopyWith<$Res> {
  __$$RecallItemImplCopyWithImpl(
      _$RecallItemImpl _value, $Res Function(_$RecallItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemName = null,
    Object? price = null,
    Object? image = null,
    Object? description = null,
    Object? item = null,
    Object? recall = null,
    Object? quantity = null,
  }) {
    return _then(_$RecallItemImpl(
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
      recall: null == recall
          ? _value.recall
          : recall // ignore: cast_nullable_to_non_nullable
              as Recall,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecallItemImpl extends _RecallItem {
  _$RecallItemImpl(
      {required this.itemName,
      required this.price,
      required this.image,
      required this.description,
      required this.item,
      required this.recall,
      required this.quantity})
      : super._();

  factory _$RecallItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecallItemImplFromJson(json);

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
  final Recall recall;
  @override
  final int quantity;

  @override
  String toString() {
    return 'RecallItem(itemName: $itemName, price: $price, image: $image, description: $description, item: $item, recall: $recall, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecallItemImpl &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.recall, recall) || other.recall == recall) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, itemName, price, image, description, item, recall, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecallItemImplCopyWith<_$RecallItemImpl> get copyWith =>
      __$$RecallItemImplCopyWithImpl<_$RecallItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecallItemImplToJson(
      this,
    );
  }
}

abstract class _RecallItem extends RecallItem {
  factory _RecallItem(
      {required final String itemName,
      required final num price,
      required final String image,
      required final String description,
      required final Item item,
      required final Recall recall,
      required final int quantity}) = _$RecallItemImpl;
  _RecallItem._() : super._();

  factory _RecallItem.fromJson(Map<String, dynamic> json) =
      _$RecallItemImpl.fromJson;

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
  Recall get recall;
  @override
  int get quantity;
  @override
  @JsonKey(ignore: true)
  _$$RecallItemImplCopyWith<_$RecallItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
