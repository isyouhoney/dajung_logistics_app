// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Item _$ItemFromJson(Map<String, dynamic> json) {
  return _Item.fromJson(json);
}

/// @nodoc
mixin _$Item {
  String get itemName => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  String get images => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  ItemCategory get category => throw _privateConstructorUsedError;
  ItemStatus? get status => throw _privateConstructorUsedError;
  User? get owner => throw _privateConstructorUsedError;
  List<Role>? get targets => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemCopyWith<Item> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res, Item>;
  @useResult
  $Res call(
      {String itemName,
      int price,
      String images,
      String description,
      ItemCategory category,
      ItemStatus? status,
      User? owner,
      List<Role>? targets});

  $ItemCategoryCopyWith<$Res> get category;
  $UserCopyWith<$Res>? get owner;
}

/// @nodoc
class _$ItemCopyWithImpl<$Res, $Val extends Item>
    implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemName = null,
    Object? price = null,
    Object? images = null,
    Object? description = null,
    Object? category = null,
    Object? status = freezed,
    Object? owner = freezed,
    Object? targets = freezed,
  }) {
    return _then(_value.copyWith(
      itemName: null == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ItemCategory,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ItemStatus?,
      owner: freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as User?,
      targets: freezed == targets
          ? _value.targets
          : targets // ignore: cast_nullable_to_non_nullable
              as List<Role>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ItemCategoryCopyWith<$Res> get category {
    return $ItemCategoryCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get owner {
    if (_value.owner == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.owner!, (value) {
      return _then(_value.copyWith(owner: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ItemImplCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$$ItemImplCopyWith(
          _$ItemImpl value, $Res Function(_$ItemImpl) then) =
      __$$ItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String itemName,
      int price,
      String images,
      String description,
      ItemCategory category,
      ItemStatus? status,
      User? owner,
      List<Role>? targets});

  @override
  $ItemCategoryCopyWith<$Res> get category;
  @override
  $UserCopyWith<$Res>? get owner;
}

/// @nodoc
class __$$ItemImplCopyWithImpl<$Res>
    extends _$ItemCopyWithImpl<$Res, _$ItemImpl>
    implements _$$ItemImplCopyWith<$Res> {
  __$$ItemImplCopyWithImpl(_$ItemImpl _value, $Res Function(_$ItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemName = null,
    Object? price = null,
    Object? images = null,
    Object? description = null,
    Object? category = null,
    Object? status = freezed,
    Object? owner = freezed,
    Object? targets = freezed,
  }) {
    return _then(_$ItemImpl(
      itemName: null == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ItemCategory,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ItemStatus?,
      owner: freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as User?,
      targets: freezed == targets
          ? _value._targets
          : targets // ignore: cast_nullable_to_non_nullable
              as List<Role>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemImpl extends _Item {
  _$ItemImpl(
      {required this.itemName,
      required this.price,
      required this.images,
      required this.description,
      required this.category,
      this.status,
      this.owner,
      final List<Role>? targets})
      : _targets = targets,
        super._();

  factory _$ItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemImplFromJson(json);

  @override
  final String itemName;
  @override
  final int price;
  @override
  final String images;
  @override
  final String description;
  @override
  final ItemCategory category;
  @override
  final ItemStatus? status;
  @override
  final User? owner;
  final List<Role>? _targets;
  @override
  List<Role>? get targets {
    final value = _targets;
    if (value == null) return null;
    if (_targets is EqualUnmodifiableListView) return _targets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Item(itemName: $itemName, price: $price, images: $images, description: $description, category: $category, status: $status, owner: $owner, targets: $targets)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemImpl &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.images, images) || other.images == images) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            const DeepCollectionEquality().equals(other._targets, _targets));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      itemName,
      price,
      images,
      description,
      category,
      status,
      owner,
      const DeepCollectionEquality().hash(_targets));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemImplCopyWith<_$ItemImpl> get copyWith =>
      __$$ItemImplCopyWithImpl<_$ItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemImplToJson(
      this,
    );
  }
}

abstract class _Item extends Item {
  factory _Item(
      {required final String itemName,
      required final int price,
      required final String images,
      required final String description,
      required final ItemCategory category,
      final ItemStatus? status,
      final User? owner,
      final List<Role>? targets}) = _$ItemImpl;
  _Item._() : super._();

  factory _Item.fromJson(Map<String, dynamic> json) = _$ItemImpl.fromJson;

  @override
  String get itemName;
  @override
  int get price;
  @override
  String get images;
  @override
  String get description;
  @override
  ItemCategory get category;
  @override
  ItemStatus? get status;
  @override
  User? get owner;
  @override
  List<Role>? get targets;
  @override
  @JsonKey(ignore: true)
  _$$ItemImplCopyWith<_$ItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
