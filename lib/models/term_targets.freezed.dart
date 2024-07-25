// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'term_targets.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TermTargets _$TermTargetsFromJson(Map<String, dynamic> json) {
  return _TermTargets.fromJson(json);
}

/// @nodoc
mixin _$TermTargets {
  Role get target => throw _privateConstructorUsedError;
  List<Term> get terms => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TermTargetsCopyWith<TermTargets> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TermTargetsCopyWith<$Res> {
  factory $TermTargetsCopyWith(
          TermTargets value, $Res Function(TermTargets) then) =
      _$TermTargetsCopyWithImpl<$Res, TermTargets>;
  @useResult
  $Res call({Role target, List<Term> terms});
}

/// @nodoc
class _$TermTargetsCopyWithImpl<$Res, $Val extends TermTargets>
    implements $TermTargetsCopyWith<$Res> {
  _$TermTargetsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? target = null,
    Object? terms = null,
  }) {
    return _then(_value.copyWith(
      target: null == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as Role,
      terms: null == terms
          ? _value.terms
          : terms // ignore: cast_nullable_to_non_nullable
              as List<Term>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TermTargetsImplCopyWith<$Res>
    implements $TermTargetsCopyWith<$Res> {
  factory _$$TermTargetsImplCopyWith(
          _$TermTargetsImpl value, $Res Function(_$TermTargetsImpl) then) =
      __$$TermTargetsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Role target, List<Term> terms});
}

/// @nodoc
class __$$TermTargetsImplCopyWithImpl<$Res>
    extends _$TermTargetsCopyWithImpl<$Res, _$TermTargetsImpl>
    implements _$$TermTargetsImplCopyWith<$Res> {
  __$$TermTargetsImplCopyWithImpl(
      _$TermTargetsImpl _value, $Res Function(_$TermTargetsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? target = null,
    Object? terms = null,
  }) {
    return _then(_$TermTargetsImpl(
      target: null == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as Role,
      terms: null == terms
          ? _value._terms
          : terms // ignore: cast_nullable_to_non_nullable
              as List<Term>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TermTargetsImpl extends _TermTargets {
  _$TermTargetsImpl({required this.target, required final List<Term> terms})
      : _terms = terms,
        super._();

  factory _$TermTargetsImpl.fromJson(Map<String, dynamic> json) =>
      _$$TermTargetsImplFromJson(json);

  @override
  final Role target;
  final List<Term> _terms;
  @override
  List<Term> get terms {
    if (_terms is EqualUnmodifiableListView) return _terms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_terms);
  }

  @override
  String toString() {
    return 'TermTargets(target: $target, terms: $terms)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TermTargetsImpl &&
            (identical(other.target, target) || other.target == target) &&
            const DeepCollectionEquality().equals(other._terms, _terms));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, target, const DeepCollectionEquality().hash(_terms));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TermTargetsImplCopyWith<_$TermTargetsImpl> get copyWith =>
      __$$TermTargetsImplCopyWithImpl<_$TermTargetsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TermTargetsImplToJson(
      this,
    );
  }
}

abstract class _TermTargets extends TermTargets {
  factory _TermTargets(
      {required final Role target,
      required final List<Term> terms}) = _$TermTargetsImpl;
  _TermTargets._() : super._();

  factory _TermTargets.fromJson(Map<String, dynamic> json) =
      _$TermTargetsImpl.fromJson;

  @override
  Role get target;
  @override
  List<Term> get terms;
  @override
  @JsonKey(ignore: true)
  _$$TermTargetsImplCopyWith<_$TermTargetsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
