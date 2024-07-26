// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ItemCategory _$ItemCategoryFromJson(Map<String, dynamic> json) {
  return _ItemCategory.fromJson(json);
}

/// @nodoc
mixin _$ItemCategory {
  int get id => throw _privateConstructorUsedError;
  String get categoryName => throw _privateConstructorUsedError;
  User? get mainStore => throw _privateConstructorUsedError;
  List<Item>? get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemCategoryCopyWith<ItemCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCategoryCopyWith<$Res> {
  factory $ItemCategoryCopyWith(
          ItemCategory value, $Res Function(ItemCategory) then) =
      _$ItemCategoryCopyWithImpl<$Res, ItemCategory>;
  @useResult
  $Res call({int id, String categoryName, User? mainStore, List<Item>? items});

  $UserCopyWith<$Res>? get mainStore;
}

/// @nodoc
class _$ItemCategoryCopyWithImpl<$Res, $Val extends ItemCategory>
    implements $ItemCategoryCopyWith<$Res> {
  _$ItemCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? categoryName = null,
    Object? mainStore = freezed,
    Object? items = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      mainStore: freezed == mainStore
          ? _value.mainStore
          : mainStore // ignore: cast_nullable_to_non_nullable
              as User?,
      items: freezed == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get mainStore {
    if (_value.mainStore == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.mainStore!, (value) {
      return _then(_value.copyWith(mainStore: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ItemCategoryImplCopyWith<$Res>
    implements $ItemCategoryCopyWith<$Res> {
  factory _$$ItemCategoryImplCopyWith(
          _$ItemCategoryImpl value, $Res Function(_$ItemCategoryImpl) then) =
      __$$ItemCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String categoryName, User? mainStore, List<Item>? items});

  @override
  $UserCopyWith<$Res>? get mainStore;
}

/// @nodoc
class __$$ItemCategoryImplCopyWithImpl<$Res>
    extends _$ItemCategoryCopyWithImpl<$Res, _$ItemCategoryImpl>
    implements _$$ItemCategoryImplCopyWith<$Res> {
  __$$ItemCategoryImplCopyWithImpl(
      _$ItemCategoryImpl _value, $Res Function(_$ItemCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? categoryName = null,
    Object? mainStore = freezed,
    Object? items = freezed,
  }) {
    return _then(_$ItemCategoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      mainStore: freezed == mainStore
          ? _value.mainStore
          : mainStore // ignore: cast_nullable_to_non_nullable
              as User?,
      items: freezed == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemCategoryImpl extends _ItemCategory {
  _$ItemCategoryImpl(
      {required this.id,
      required this.categoryName,
      this.mainStore,
      final List<Item>? items})
      : _items = items,
        super._();

  factory _$ItemCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemCategoryImplFromJson(json);

  @override
  final int id;
  @override
  final String categoryName;
  @override
  final User? mainStore;
  final List<Item>? _items;
  @override
  List<Item>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ItemCategory(id: $id, categoryName: $categoryName, mainStore: $mainStore, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.mainStore, mainStore) ||
                other.mainStore == mainStore) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, categoryName, mainStore,
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemCategoryImplCopyWith<_$ItemCategoryImpl> get copyWith =>
      __$$ItemCategoryImplCopyWithImpl<_$ItemCategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemCategoryImplToJson(
      this,
    );
  }
}

abstract class _ItemCategory extends ItemCategory {
  factory _ItemCategory(
      {required final int id,
      required final String categoryName,
      final User? mainStore,
      final List<Item>? items}) = _$ItemCategoryImpl;
  _ItemCategory._() : super._();

  factory _ItemCategory.fromJson(Map<String, dynamic> json) =
      _$ItemCategoryImpl.fromJson;

  @override
  int get id;
  @override
  String get categoryName;
  @override
  User? get mainStore;
  @override
  List<Item>? get items;
  @override
  @JsonKey(ignore: true)
  _$$ItemCategoryImplCopyWith<_$ItemCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
