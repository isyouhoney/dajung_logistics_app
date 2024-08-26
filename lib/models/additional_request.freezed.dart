// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'additional_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AdditionalRequest _$AdditionalRequestFromJson(Map<String, dynamic> json) {
  return _AdditionalRequest.fromJson(json);
}

/// @nodoc
mixin _$AdditionalRequest {
  int? get id => throw _privateConstructorUsedError;
  OrderItem get orderItem => throw _privateConstructorUsedError;
  String get requestDate => throw _privateConstructorUsedError;
  User? get request => throw _privateConstructorUsedError;
  User? get accept => throw _privateConstructorUsedError;
  dynamic get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdditionalRequestCopyWith<AdditionalRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdditionalRequestCopyWith<$Res> {
  factory $AdditionalRequestCopyWith(
          AdditionalRequest value, $Res Function(AdditionalRequest) then) =
      _$AdditionalRequestCopyWithImpl<$Res, AdditionalRequest>;
  @useResult
  $Res call(
      {int? id,
      OrderItem orderItem,
      String requestDate,
      User? request,
      User? accept,
      dynamic status});

  $OrderItemCopyWith<$Res> get orderItem;
  $UserCopyWith<$Res>? get request;
  $UserCopyWith<$Res>? get accept;
}

/// @nodoc
class _$AdditionalRequestCopyWithImpl<$Res, $Val extends AdditionalRequest>
    implements $AdditionalRequestCopyWith<$Res> {
  _$AdditionalRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? orderItem = null,
    Object? requestDate = null,
    Object? request = freezed,
    Object? accept = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      orderItem: null == orderItem
          ? _value.orderItem
          : orderItem // ignore: cast_nullable_to_non_nullable
              as OrderItem,
      requestDate: null == requestDate
          ? _value.requestDate
          : requestDate // ignore: cast_nullable_to_non_nullable
              as String,
      request: freezed == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as User?,
      accept: freezed == accept
          ? _value.accept
          : accept // ignore: cast_nullable_to_non_nullable
              as User?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderItemCopyWith<$Res> get orderItem {
    return $OrderItemCopyWith<$Res>(_value.orderItem, (value) {
      return _then(_value.copyWith(orderItem: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get request {
    if (_value.request == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.request!, (value) {
      return _then(_value.copyWith(request: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get accept {
    if (_value.accept == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.accept!, (value) {
      return _then(_value.copyWith(accept: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AdditionalRequestImplCopyWith<$Res>
    implements $AdditionalRequestCopyWith<$Res> {
  factory _$$AdditionalRequestImplCopyWith(_$AdditionalRequestImpl value,
          $Res Function(_$AdditionalRequestImpl) then) =
      __$$AdditionalRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      OrderItem orderItem,
      String requestDate,
      User? request,
      User? accept,
      dynamic status});

  @override
  $OrderItemCopyWith<$Res> get orderItem;
  @override
  $UserCopyWith<$Res>? get request;
  @override
  $UserCopyWith<$Res>? get accept;
}

/// @nodoc
class __$$AdditionalRequestImplCopyWithImpl<$Res>
    extends _$AdditionalRequestCopyWithImpl<$Res, _$AdditionalRequestImpl>
    implements _$$AdditionalRequestImplCopyWith<$Res> {
  __$$AdditionalRequestImplCopyWithImpl(_$AdditionalRequestImpl _value,
      $Res Function(_$AdditionalRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? orderItem = null,
    Object? requestDate = null,
    Object? request = freezed,
    Object? accept = freezed,
    Object? status = freezed,
  }) {
    return _then(_$AdditionalRequestImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      orderItem: null == orderItem
          ? _value.orderItem
          : orderItem // ignore: cast_nullable_to_non_nullable
              as OrderItem,
      requestDate: null == requestDate
          ? _value.requestDate
          : requestDate // ignore: cast_nullable_to_non_nullable
              as String,
      request: freezed == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as User?,
      accept: freezed == accept
          ? _value.accept
          : accept // ignore: cast_nullable_to_non_nullable
              as User?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdditionalRequestImpl extends _AdditionalRequest {
  _$AdditionalRequestImpl(
      {this.id,
      required this.orderItem,
      required this.requestDate,
      this.request,
      this.accept,
      this.status})
      : super._();

  factory _$AdditionalRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdditionalRequestImplFromJson(json);

  @override
  final int? id;
  @override
  final OrderItem orderItem;
  @override
  final String requestDate;
  @override
  final User? request;
  @override
  final User? accept;
  @override
  final dynamic status;

  @override
  String toString() {
    return 'AdditionalRequest(id: $id, orderItem: $orderItem, requestDate: $requestDate, request: $request, accept: $accept, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdditionalRequestImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderItem, orderItem) ||
                other.orderItem == orderItem) &&
            (identical(other.requestDate, requestDate) ||
                other.requestDate == requestDate) &&
            (identical(other.request, request) || other.request == request) &&
            (identical(other.accept, accept) || other.accept == accept) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, orderItem, requestDate,
      request, accept, const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AdditionalRequestImplCopyWith<_$AdditionalRequestImpl> get copyWith =>
      __$$AdditionalRequestImplCopyWithImpl<_$AdditionalRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdditionalRequestImplToJson(
      this,
    );
  }
}

abstract class _AdditionalRequest extends AdditionalRequest {
  factory _AdditionalRequest(
      {final int? id,
      required final OrderItem orderItem,
      required final String requestDate,
      final User? request,
      final User? accept,
      final dynamic status}) = _$AdditionalRequestImpl;
  _AdditionalRequest._() : super._();

  factory _AdditionalRequest.fromJson(Map<String, dynamic> json) =
      _$AdditionalRequestImpl.fromJson;

  @override
  int? get id;
  @override
  OrderItem get orderItem;
  @override
  String get requestDate;
  @override
  User? get request;
  @override
  User? get accept;
  @override
  dynamic get status;
  @override
  @JsonKey(ignore: true)
  _$$AdditionalRequestImplCopyWith<_$AdditionalRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
