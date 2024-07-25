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
  String get image => throw _privateConstructorUsedError;
  bool get storeOwnerCheck => throw _privateConstructorUsedError;
  Recall get recallItems => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecallCopyWith<Recall> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecallCopyWith<$Res> {
  factory $RecallCopyWith(Recall value, $Res Function(Recall) then) =
      _$RecallCopyWithImpl<$Res, Recall>;
  @useResult
  $Res call({String image, bool storeOwnerCheck, Recall recallItems});

  $RecallCopyWith<$Res> get recallItems;
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
    Object? image = null,
    Object? storeOwnerCheck = null,
    Object? recallItems = null,
  }) {
    return _then(_value.copyWith(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      storeOwnerCheck: null == storeOwnerCheck
          ? _value.storeOwnerCheck
          : storeOwnerCheck // ignore: cast_nullable_to_non_nullable
              as bool,
      recallItems: null == recallItems
          ? _value.recallItems
          : recallItems // ignore: cast_nullable_to_non_nullable
              as Recall,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RecallCopyWith<$Res> get recallItems {
    return $RecallCopyWith<$Res>(_value.recallItems, (value) {
      return _then(_value.copyWith(recallItems: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RecallImplCopyWith<$Res> implements $RecallCopyWith<$Res> {
  factory _$$RecallImplCopyWith(
          _$RecallImpl value, $Res Function(_$RecallImpl) then) =
      __$$RecallImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String image, bool storeOwnerCheck, Recall recallItems});

  @override
  $RecallCopyWith<$Res> get recallItems;
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
    Object? image = null,
    Object? storeOwnerCheck = null,
    Object? recallItems = null,
  }) {
    return _then(_$RecallImpl(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      storeOwnerCheck: null == storeOwnerCheck
          ? _value.storeOwnerCheck
          : storeOwnerCheck // ignore: cast_nullable_to_non_nullable
              as bool,
      recallItems: null == recallItems
          ? _value.recallItems
          : recallItems // ignore: cast_nullable_to_non_nullable
              as Recall,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecallImpl extends _Recall {
  _$RecallImpl(
      {required this.image,
      required this.storeOwnerCheck,
      required this.recallItems})
      : super._();

  factory _$RecallImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecallImplFromJson(json);

  @override
  final String image;
  @override
  final bool storeOwnerCheck;
  @override
  final Recall recallItems;

  @override
  String toString() {
    return 'Recall(image: $image, storeOwnerCheck: $storeOwnerCheck, recallItems: $recallItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecallImpl &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.storeOwnerCheck, storeOwnerCheck) ||
                other.storeOwnerCheck == storeOwnerCheck) &&
            (identical(other.recallItems, recallItems) ||
                other.recallItems == recallItems));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, image, storeOwnerCheck, recallItems);

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
      {required final String image,
      required final bool storeOwnerCheck,
      required final Recall recallItems}) = _$RecallImpl;
  _Recall._() : super._();

  factory _Recall.fromJson(Map<String, dynamic> json) = _$RecallImpl.fromJson;

  @override
  String get image;
  @override
  bool get storeOwnerCheck;
  @override
  Recall get recallItems;
  @override
  @JsonKey(ignore: true)
  _$$RecallImplCopyWith<_$RecallImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
