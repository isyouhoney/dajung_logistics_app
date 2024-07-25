// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'agreement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Agreement _$AgreementFromJson(Map<String, dynamic> json) {
  return _Agreement.fromJson(json);
}

/// @nodoc
mixin _$Agreement {
  int get termId => throw _privateConstructorUsedError; // required User user,
  bool get isAgree => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AgreementCopyWith<Agreement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgreementCopyWith<$Res> {
  factory $AgreementCopyWith(Agreement value, $Res Function(Agreement) then) =
      _$AgreementCopyWithImpl<$Res, Agreement>;
  @useResult
  $Res call({int termId, bool isAgree});
}

/// @nodoc
class _$AgreementCopyWithImpl<$Res, $Val extends Agreement>
    implements $AgreementCopyWith<$Res> {
  _$AgreementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? termId = null,
    Object? isAgree = null,
  }) {
    return _then(_value.copyWith(
      termId: null == termId
          ? _value.termId
          : termId // ignore: cast_nullable_to_non_nullable
              as int,
      isAgree: null == isAgree
          ? _value.isAgree
          : isAgree // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AgreementImplCopyWith<$Res>
    implements $AgreementCopyWith<$Res> {
  factory _$$AgreementImplCopyWith(
          _$AgreementImpl value, $Res Function(_$AgreementImpl) then) =
      __$$AgreementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int termId, bool isAgree});
}

/// @nodoc
class __$$AgreementImplCopyWithImpl<$Res>
    extends _$AgreementCopyWithImpl<$Res, _$AgreementImpl>
    implements _$$AgreementImplCopyWith<$Res> {
  __$$AgreementImplCopyWithImpl(
      _$AgreementImpl _value, $Res Function(_$AgreementImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? termId = null,
    Object? isAgree = null,
  }) {
    return _then(_$AgreementImpl(
      termId: null == termId
          ? _value.termId
          : termId // ignore: cast_nullable_to_non_nullable
              as int,
      isAgree: null == isAgree
          ? _value.isAgree
          : isAgree // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AgreementImpl extends _Agreement {
  _$AgreementImpl({required this.termId, required this.isAgree}) : super._();

  factory _$AgreementImpl.fromJson(Map<String, dynamic> json) =>
      _$$AgreementImplFromJson(json);

  @override
  final int termId;
// required User user,
  @override
  final bool isAgree;

  @override
  String toString() {
    return 'Agreement(termId: $termId, isAgree: $isAgree)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AgreementImpl &&
            (identical(other.termId, termId) || other.termId == termId) &&
            (identical(other.isAgree, isAgree) || other.isAgree == isAgree));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, termId, isAgree);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AgreementImplCopyWith<_$AgreementImpl> get copyWith =>
      __$$AgreementImplCopyWithImpl<_$AgreementImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AgreementImplToJson(
      this,
    );
  }
}

abstract class _Agreement extends Agreement {
  factory _Agreement({required final int termId, required final bool isAgree}) =
      _$AgreementImpl;
  _Agreement._() : super._();

  factory _Agreement.fromJson(Map<String, dynamic> json) =
      _$AgreementImpl.fromJson;

  @override
  int get termId;
  @override // required User user,
  bool get isAgree;
  @override
  @JsonKey(ignore: true)
  _$$AgreementImplCopyWith<_$AgreementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
