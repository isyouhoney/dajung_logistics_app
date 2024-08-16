// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recall.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Recall _$RecallFromJson(Map<String, dynamic> json) {
  return _Recall.fromJson(json);
}

/// @nodoc
mixin _$Recall {
  List<String> get images => throw _privateConstructorUsedError;
  List<OrderItem> get recallItems => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecallCopyWith<Recall> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecallCopyWith<$Res> {
  factory $RecallCopyWith(Recall value, $Res Function(Recall) then) =
      _$RecallCopyWithImpl<$Res, Recall>;
  @useResult
  $Res call({List<String> images, List<OrderItem> recallItems});
}

/// @nodoc
class _$RecallCopyWithImpl<$Res, $Val extends Recall>
    implements $RecallCopyWith<$Res> {
  _$RecallCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? images = null,
    Object? recallItems = null,
  }) {
    return _then(_value.copyWith(
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      recallItems: null == recallItems
          ? _value.recallItems
          : recallItems // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecallImplCopyWith<$Res> implements $RecallCopyWith<$Res> {
  factory _$$RecallImplCopyWith(
          _$RecallImpl value, $Res Function(_$RecallImpl) then) =
      __$$RecallImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> images, List<OrderItem> recallItems});
}

/// @nodoc
class __$$RecallImplCopyWithImpl<$Res>
    extends _$RecallCopyWithImpl<$Res, _$RecallImpl>
    implements _$$RecallImplCopyWith<$Res> {
  __$$RecallImplCopyWithImpl(
      _$RecallImpl _value, $Res Function(_$RecallImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? images = null,
    Object? recallItems = null,
  }) {
    return _then(_$RecallImpl(
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      recallItems: null == recallItems
          ? _value._recallItems
          : recallItems // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecallImpl extends _Recall {
  _$RecallImpl(
      {required final List<String> images,
      required final List<OrderItem> recallItems})
      : _images = images,
        _recallItems = recallItems,
        super._();

  factory _$RecallImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecallImplFromJson(json);

  final List<String> _images;
  @override
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  final List<OrderItem> _recallItems;
  @override
  List<OrderItem> get recallItems {
    if (_recallItems is EqualUnmodifiableListView) return _recallItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recallItems);
  }

  @override
  String toString() {
    return 'Recall(images: $images, recallItems: $recallItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecallImpl &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality()
                .equals(other._recallItems, _recallItems));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_images),
      const DeepCollectionEquality().hash(_recallItems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecallImplCopyWith<_$RecallImpl> get copyWith =>
      __$$RecallImplCopyWithImpl<_$RecallImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecallImplToJson(
      this,
    );
  }
}

abstract class _Recall extends Recall {
  factory _Recall(
      {required final List<String> images,
      required final List<OrderItem> recallItems}) = _$RecallImpl;
  _Recall._() : super._();

  factory _Recall.fromJson(Map<String, dynamic> json) = _$RecallImpl.fromJson;

  @override
  List<String> get images;
  @override
  List<OrderItem> get recallItems;
  @override
  @JsonKey(ignore: true)
  _$$RecallImplCopyWith<_$RecallImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
