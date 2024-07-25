// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

notification _$notificationFromJson(Map<String, dynamic> json) {
  return _notification.fromJson(json);
}

/// @nodoc
mixin _$notification {
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get images => throw _privateConstructorUsedError;
  String get topFixed => throw _privateConstructorUsedError;
  String get targets => throw _privateConstructorUsedError;
  String get writer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $notificationCopyWith<notification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $notificationCopyWith<$Res> {
  factory $notificationCopyWith(
          notification value, $Res Function(notification) then) =
      _$notificationCopyWithImpl<$Res, notification>;
  @useResult
  $Res call(
      {String title,
      String content,
      String images,
      String topFixed,
      String targets,
      String writer});
}

/// @nodoc
class _$notificationCopyWithImpl<$Res, $Val extends notification>
    implements $notificationCopyWith<$Res> {
  _$notificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
    Object? images = null,
    Object? topFixed = null,
    Object? targets = null,
    Object? writer = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as String,
      topFixed: null == topFixed
          ? _value.topFixed
          : topFixed // ignore: cast_nullable_to_non_nullable
              as String,
      targets: null == targets
          ? _value.targets
          : targets // ignore: cast_nullable_to_non_nullable
              as String,
      writer: null == writer
          ? _value.writer
          : writer // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$notificationImplCopyWith<$Res>
    implements $notificationCopyWith<$Res> {
  factory _$$notificationImplCopyWith(
          _$notificationImpl value, $Res Function(_$notificationImpl) then) =
      __$$notificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String content,
      String images,
      String topFixed,
      String targets,
      String writer});
}

/// @nodoc
class __$$notificationImplCopyWithImpl<$Res>
    extends _$notificationCopyWithImpl<$Res, _$notificationImpl>
    implements _$$notificationImplCopyWith<$Res> {
  __$$notificationImplCopyWithImpl(
      _$notificationImpl _value, $Res Function(_$notificationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
    Object? images = null,
    Object? topFixed = null,
    Object? targets = null,
    Object? writer = null,
  }) {
    return _then(_$notificationImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as String,
      topFixed: null == topFixed
          ? _value.topFixed
          : topFixed // ignore: cast_nullable_to_non_nullable
              as String,
      targets: null == targets
          ? _value.targets
          : targets // ignore: cast_nullable_to_non_nullable
              as String,
      writer: null == writer
          ? _value.writer
          : writer // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$notificationImpl extends _notification {
  _$notificationImpl(
      {required this.title,
      required this.content,
      required this.images,
      required this.topFixed,
      required this.targets,
      required this.writer})
      : super._();

  factory _$notificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$notificationImplFromJson(json);

  @override
  final String title;
  @override
  final String content;
  @override
  final String images;
  @override
  final String topFixed;
  @override
  final String targets;
  @override
  final String writer;

  @override
  String toString() {
    return 'notification(title: $title, content: $content, images: $images, topFixed: $topFixed, targets: $targets, writer: $writer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$notificationImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.images, images) || other.images == images) &&
            (identical(other.topFixed, topFixed) ||
                other.topFixed == topFixed) &&
            (identical(other.targets, targets) || other.targets == targets) &&
            (identical(other.writer, writer) || other.writer == writer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, title, content, images, topFixed, targets, writer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$notificationImplCopyWith<_$notificationImpl> get copyWith =>
      __$$notificationImplCopyWithImpl<_$notificationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$notificationImplToJson(
      this,
    );
  }
}

abstract class _notification extends notification {
  factory _notification(
      {required final String title,
      required final String content,
      required final String images,
      required final String topFixed,
      required final String targets,
      required final String writer}) = _$notificationImpl;
  _notification._() : super._();

  factory _notification.fromJson(Map<String, dynamic> json) =
      _$notificationImpl.fromJson;

  @override
  String get title;
  @override
  String get content;
  @override
  String get images;
  @override
  String get topFixed;
  @override
  String get targets;
  @override
  String get writer;
  @override
  @JsonKey(ignore: true)
  _$$notificationImplCopyWith<_$notificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
