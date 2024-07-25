// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_targets.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ItemTargets _$ItemTargetsFromJson(Map<String, dynamic> json) {
  return _ItemTargets.fromJson(json);
}

/// @nodoc
mixin _$ItemTargets {
  Role get target => throw _privateConstructorUsedError;
  Item get item => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemTargetsCopyWith<ItemTargets> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemTargetsCopyWith<$Res> {
  factory $ItemTargetsCopyWith(
          ItemTargets value, $Res Function(ItemTargets) then) =
      _$ItemTargetsCopyWithImpl<$Res, ItemTargets>;
  @useResult
  $Res call({Role target, Item item});

  $ItemCopyWith<$Res> get item;
}

/// @nodoc
class _$ItemTargetsCopyWithImpl<$Res, $Val extends ItemTargets>
    implements $ItemTargetsCopyWith<$Res> {
  _$ItemTargetsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? target = null,
    Object? item = null,
  }) {
    return _then(_value.copyWith(
      target: null == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as Role,
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as Item,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ItemCopyWith<$Res> get item {
    return $ItemCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ItemTargetsImplCopyWith<$Res>
    implements $ItemTargetsCopyWith<$Res> {
  factory _$$ItemTargetsImplCopyWith(
          _$ItemTargetsImpl value, $Res Function(_$ItemTargetsImpl) then) =
      __$$ItemTargetsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Role target, Item item});

  @override
  $ItemCopyWith<$Res> get item;
}

/// @nodoc
class __$$ItemTargetsImplCopyWithImpl<$Res>
    extends _$ItemTargetsCopyWithImpl<$Res, _$ItemTargetsImpl>
    implements _$$ItemTargetsImplCopyWith<$Res> {
  __$$ItemTargetsImplCopyWithImpl(
      _$ItemTargetsImpl _value, $Res Function(_$ItemTargetsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? target = null,
    Object? item = null,
  }) {
    return _then(_$ItemTargetsImpl(
      target: null == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as Role,
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as Item,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemTargetsImpl extends _ItemTargets {
  _$ItemTargetsImpl({required this.target, required this.item}) : super._();

  factory _$ItemTargetsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemTargetsImplFromJson(json);

  @override
  final Role target;
  @override
  final Item item;

  @override
  String toString() {
    return 'ItemTargets(target: $target, item: $item)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemTargetsImpl &&
            (identical(other.target, target) || other.target == target) &&
            (identical(other.item, item) || other.item == item));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, target, item);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemTargetsImplCopyWith<_$ItemTargetsImpl> get copyWith =>
      __$$ItemTargetsImplCopyWithImpl<_$ItemTargetsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemTargetsImplToJson(
      this,
    );
  }
}

abstract class _ItemTargets extends ItemTargets {
  factory _ItemTargets({required final Role target, required final Item item}) =
      _$ItemTargetsImpl;
  _ItemTargets._() : super._();

  factory _ItemTargets.fromJson(Map<String, dynamic> json) =
      _$ItemTargetsImpl.fromJson;

  @override
  Role get target;
  @override
  Item get item;
  @override
  @JsonKey(ignore: true)
  _$$ItemTargetsImplCopyWith<_$ItemTargetsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
