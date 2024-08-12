// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notice.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Notice _$NoticeFromJson(Map<String, dynamic> json) {
  return _Notice.fromJson(json);
}

/// @nodoc
mixin _$Notice {
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  List<String>? get images => throw _privateConstructorUsedError;
  bool get topFixed => throw _privateConstructorUsedError;
  List<dynamic>? get targets => throw _privateConstructorUsedError;
  User? get writer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NoticeCopyWith<Notice> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoticeCopyWith<$Res> {
  factory $NoticeCopyWith(Notice value, $Res Function(Notice) then) =
      _$NoticeCopyWithImpl<$Res, Notice>;
  @useResult
  $Res call(
      {String title,
      String content,
      int? id,
      String? updatedAt,
      List<String>? images,
      bool topFixed,
      List<dynamic>? targets,
      User? writer});

  $UserCopyWith<$Res>? get writer;
}

/// @nodoc
class _$NoticeCopyWithImpl<$Res, $Val extends Notice>
    implements $NoticeCopyWith<$Res> {
  _$NoticeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
    Object? id = freezed,
    Object? updatedAt = freezed,
    Object? images = freezed,
    Object? topFixed = null,
    Object? targets = freezed,
    Object? writer = freezed,
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
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      topFixed: null == topFixed
          ? _value.topFixed
          : topFixed // ignore: cast_nullable_to_non_nullable
              as bool,
      targets: freezed == targets
          ? _value.targets
          : targets // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      writer: freezed == writer
          ? _value.writer
          : writer // ignore: cast_nullable_to_non_nullable
              as User?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get writer {
    if (_value.writer == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.writer!, (value) {
      return _then(_value.copyWith(writer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NoticeImplCopyWith<$Res> implements $NoticeCopyWith<$Res> {
  factory _$$NoticeImplCopyWith(
          _$NoticeImpl value, $Res Function(_$NoticeImpl) then) =
      __$$NoticeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String content,
      int? id,
      String? updatedAt,
      List<String>? images,
      bool topFixed,
      List<dynamic>? targets,
      User? writer});

  @override
  $UserCopyWith<$Res>? get writer;
}

/// @nodoc
class __$$NoticeImplCopyWithImpl<$Res>
    extends _$NoticeCopyWithImpl<$Res, _$NoticeImpl>
    implements _$$NoticeImplCopyWith<$Res> {
  __$$NoticeImplCopyWithImpl(
      _$NoticeImpl _value, $Res Function(_$NoticeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
    Object? id = freezed,
    Object? updatedAt = freezed,
    Object? images = freezed,
    Object? topFixed = null,
    Object? targets = freezed,
    Object? writer = freezed,
  }) {
    return _then(_$NoticeImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      topFixed: null == topFixed
          ? _value.topFixed
          : topFixed // ignore: cast_nullable_to_non_nullable
              as bool,
      targets: freezed == targets
          ? _value._targets
          : targets // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      writer: freezed == writer
          ? _value.writer
          : writer // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NoticeImpl extends _Notice {
  _$NoticeImpl(
      {required this.title,
      required this.content,
      this.id,
      this.updatedAt,
      final List<String>? images,
      required this.topFixed,
      final List<dynamic>? targets,
      this.writer})
      : _images = images,
        _targets = targets,
        super._();

  factory _$NoticeImpl.fromJson(Map<String, dynamic> json) =>
      _$$NoticeImplFromJson(json);

  @override
  final String title;
  @override
  final String content;
  @override
  final int? id;
  @override
  final String? updatedAt;
  final List<String>? _images;
  @override
  List<String>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool topFixed;
  final List<dynamic>? _targets;
  @override
  List<dynamic>? get targets {
    final value = _targets;
    if (value == null) return null;
    if (_targets is EqualUnmodifiableListView) return _targets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final User? writer;

  @override
  String toString() {
    return 'Notice(title: $title, content: $content, id: $id, updatedAt: $updatedAt, images: $images, topFixed: $topFixed, targets: $targets, writer: $writer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoticeImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.topFixed, topFixed) ||
                other.topFixed == topFixed) &&
            const DeepCollectionEquality().equals(other._targets, _targets) &&
            (identical(other.writer, writer) || other.writer == writer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      content,
      id,
      updatedAt,
      const DeepCollectionEquality().hash(_images),
      topFixed,
      const DeepCollectionEquality().hash(_targets),
      writer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NoticeImplCopyWith<_$NoticeImpl> get copyWith =>
      __$$NoticeImplCopyWithImpl<_$NoticeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NoticeImplToJson(
      this,
    );
  }
}

abstract class _Notice extends Notice {
  factory _Notice(
      {required final String title,
      required final String content,
      final int? id,
      final String? updatedAt,
      final List<String>? images,
      required final bool topFixed,
      final List<dynamic>? targets,
      final User? writer}) = _$NoticeImpl;
  _Notice._() : super._();

  factory _Notice.fromJson(Map<String, dynamic> json) = _$NoticeImpl.fromJson;

  @override
  String get title;
  @override
  String get content;
  @override
  int? get id;
  @override
  String? get updatedAt;
  @override
  List<String>? get images;
  @override
  bool get topFixed;
  @override
  List<dynamic>? get targets;
  @override
  User? get writer;
  @override
  @JsonKey(ignore: true)
  _$$NoticeImplCopyWith<_$NoticeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
