// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  int? get id => throw _privateConstructorUsedError;
  dynamic get role => throw _privateConstructorUsedError;
  String get loginId => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  String? get storeName => throw _privateConstructorUsedError;
  String get ownerName => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  dynamic get status => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get x => throw _privateConstructorUsedError;
  String? get y => throw _privateConstructorUsedError;
  List<User>? get subStores => throw _privateConstructorUsedError;
  List<User>? get deliveryMen => throw _privateConstructorUsedError;
  User? get mainStore => throw _privateConstructorUsedError;
  User? get employmentStore => throw _privateConstructorUsedError;
  List<ItemCategory>? get itemCategories => throw _privateConstructorUsedError;
  List<Item>? get items => throw _privateConstructorUsedError;
  List<Product>? get productions => throw _privateConstructorUsedError;
  List<OrderSheet>? get orderSheets => throw _privateConstructorUsedError;
  List<Agreement>? get agreements => throw _privateConstructorUsedError;
  List<LoginInfo>? get loginInfos => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {int? id,
      dynamic role,
      String loginId,
      String? password,
      String? storeName,
      String ownerName,
      String phone,
      dynamic status,
      String? address,
      String? x,
      String? y,
      List<User>? subStores,
      List<User>? deliveryMen,
      User? mainStore,
      User? employmentStore,
      List<ItemCategory>? itemCategories,
      List<Item>? items,
      List<Product>? productions,
      List<OrderSheet>? orderSheets,
      List<Agreement>? agreements,
      List<LoginInfo>? loginInfos});

  $UserCopyWith<$Res>? get mainStore;
  $UserCopyWith<$Res>? get employmentStore;
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? role = freezed,
    Object? loginId = null,
    Object? password = freezed,
    Object? storeName = freezed,
    Object? ownerName = null,
    Object? phone = null,
    Object? status = freezed,
    Object? address = freezed,
    Object? x = freezed,
    Object? y = freezed,
    Object? subStores = freezed,
    Object? deliveryMen = freezed,
    Object? mainStore = freezed,
    Object? employmentStore = freezed,
    Object? itemCategories = freezed,
    Object? items = freezed,
    Object? productions = freezed,
    Object? orderSheets = freezed,
    Object? agreements = freezed,
    Object? loginInfos = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as dynamic,
      loginId: null == loginId
          ? _value.loginId
          : loginId // ignore: cast_nullable_to_non_nullable
              as String,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      storeName: freezed == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerName: null == ownerName
          ? _value.ownerName
          : ownerName // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as dynamic,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      x: freezed == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as String?,
      y: freezed == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as String?,
      subStores: freezed == subStores
          ? _value.subStores
          : subStores // ignore: cast_nullable_to_non_nullable
              as List<User>?,
      deliveryMen: freezed == deliveryMen
          ? _value.deliveryMen
          : deliveryMen // ignore: cast_nullable_to_non_nullable
              as List<User>?,
      mainStore: freezed == mainStore
          ? _value.mainStore
          : mainStore // ignore: cast_nullable_to_non_nullable
              as User?,
      employmentStore: freezed == employmentStore
          ? _value.employmentStore
          : employmentStore // ignore: cast_nullable_to_non_nullable
              as User?,
      itemCategories: freezed == itemCategories
          ? _value.itemCategories
          : itemCategories // ignore: cast_nullable_to_non_nullable
              as List<ItemCategory>?,
      items: freezed == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>?,
      productions: freezed == productions
          ? _value.productions
          : productions // ignore: cast_nullable_to_non_nullable
              as List<Product>?,
      orderSheets: freezed == orderSheets
          ? _value.orderSheets
          : orderSheets // ignore: cast_nullable_to_non_nullable
              as List<OrderSheet>?,
      agreements: freezed == agreements
          ? _value.agreements
          : agreements // ignore: cast_nullable_to_non_nullable
              as List<Agreement>?,
      loginInfos: freezed == loginInfos
          ? _value.loginInfos
          : loginInfos // ignore: cast_nullable_to_non_nullable
              as List<LoginInfo>?,
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

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get employmentStore {
    if (_value.employmentStore == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.employmentStore!, (value) {
      return _then(_value.copyWith(employmentStore: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      dynamic role,
      String loginId,
      String? password,
      String? storeName,
      String ownerName,
      String phone,
      dynamic status,
      String? address,
      String? x,
      String? y,
      List<User>? subStores,
      List<User>? deliveryMen,
      User? mainStore,
      User? employmentStore,
      List<ItemCategory>? itemCategories,
      List<Item>? items,
      List<Product>? productions,
      List<OrderSheet>? orderSheets,
      List<Agreement>? agreements,
      List<LoginInfo>? loginInfos});

  @override
  $UserCopyWith<$Res>? get mainStore;
  @override
  $UserCopyWith<$Res>? get employmentStore;
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? role = freezed,
    Object? loginId = null,
    Object? password = freezed,
    Object? storeName = freezed,
    Object? ownerName = null,
    Object? phone = null,
    Object? status = freezed,
    Object? address = freezed,
    Object? x = freezed,
    Object? y = freezed,
    Object? subStores = freezed,
    Object? deliveryMen = freezed,
    Object? mainStore = freezed,
    Object? employmentStore = freezed,
    Object? itemCategories = freezed,
    Object? items = freezed,
    Object? productions = freezed,
    Object? orderSheets = freezed,
    Object? agreements = freezed,
    Object? loginInfos = freezed,
  }) {
    return _then(_$UserImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as dynamic,
      loginId: null == loginId
          ? _value.loginId
          : loginId // ignore: cast_nullable_to_non_nullable
              as String,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      storeName: freezed == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerName: null == ownerName
          ? _value.ownerName
          : ownerName // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as dynamic,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      x: freezed == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as String?,
      y: freezed == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as String?,
      subStores: freezed == subStores
          ? _value._subStores
          : subStores // ignore: cast_nullable_to_non_nullable
              as List<User>?,
      deliveryMen: freezed == deliveryMen
          ? _value._deliveryMen
          : deliveryMen // ignore: cast_nullable_to_non_nullable
              as List<User>?,
      mainStore: freezed == mainStore
          ? _value.mainStore
          : mainStore // ignore: cast_nullable_to_non_nullable
              as User?,
      employmentStore: freezed == employmentStore
          ? _value.employmentStore
          : employmentStore // ignore: cast_nullable_to_non_nullable
              as User?,
      itemCategories: freezed == itemCategories
          ? _value._itemCategories
          : itemCategories // ignore: cast_nullable_to_non_nullable
              as List<ItemCategory>?,
      items: freezed == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>?,
      productions: freezed == productions
          ? _value._productions
          : productions // ignore: cast_nullable_to_non_nullable
              as List<Product>?,
      orderSheets: freezed == orderSheets
          ? _value._orderSheets
          : orderSheets // ignore: cast_nullable_to_non_nullable
              as List<OrderSheet>?,
      agreements: freezed == agreements
          ? _value._agreements
          : agreements // ignore: cast_nullable_to_non_nullable
              as List<Agreement>?,
      loginInfos: freezed == loginInfos
          ? _value._loginInfos
          : loginInfos // ignore: cast_nullable_to_non_nullable
              as List<LoginInfo>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl extends _User {
  _$UserImpl(
      {this.id,
      required this.role,
      required this.loginId,
      this.password,
      this.storeName,
      required this.ownerName,
      required this.phone,
      required this.status,
      this.address,
      this.x,
      this.y,
      final List<User>? subStores,
      final List<User>? deliveryMen,
      this.mainStore,
      this.employmentStore,
      final List<ItemCategory>? itemCategories,
      final List<Item>? items,
      final List<Product>? productions,
      final List<OrderSheet>? orderSheets,
      final List<Agreement>? agreements,
      final List<LoginInfo>? loginInfos})
      : _subStores = subStores,
        _deliveryMen = deliveryMen,
        _itemCategories = itemCategories,
        _items = items,
        _productions = productions,
        _orderSheets = orderSheets,
        _agreements = agreements,
        _loginInfos = loginInfos,
        super._();

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final int? id;
  @override
  final dynamic role;
  @override
  final String loginId;
  @override
  final String? password;
  @override
  final String? storeName;
  @override
  final String ownerName;
  @override
  final String phone;
  @override
  final dynamic status;
  @override
  final String? address;
  @override
  final String? x;
  @override
  final String? y;
  final List<User>? _subStores;
  @override
  List<User>? get subStores {
    final value = _subStores;
    if (value == null) return null;
    if (_subStores is EqualUnmodifiableListView) return _subStores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<User>? _deliveryMen;
  @override
  List<User>? get deliveryMen {
    final value = _deliveryMen;
    if (value == null) return null;
    if (_deliveryMen is EqualUnmodifiableListView) return _deliveryMen;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final User? mainStore;
  @override
  final User? employmentStore;
  final List<ItemCategory>? _itemCategories;
  @override
  List<ItemCategory>? get itemCategories {
    final value = _itemCategories;
    if (value == null) return null;
    if (_itemCategories is EqualUnmodifiableListView) return _itemCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Item>? _items;
  @override
  List<Item>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Product>? _productions;
  @override
  List<Product>? get productions {
    final value = _productions;
    if (value == null) return null;
    if (_productions is EqualUnmodifiableListView) return _productions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<OrderSheet>? _orderSheets;
  @override
  List<OrderSheet>? get orderSheets {
    final value = _orderSheets;
    if (value == null) return null;
    if (_orderSheets is EqualUnmodifiableListView) return _orderSheets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Agreement>? _agreements;
  @override
  List<Agreement>? get agreements {
    final value = _agreements;
    if (value == null) return null;
    if (_agreements is EqualUnmodifiableListView) return _agreements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<LoginInfo>? _loginInfos;
  @override
  List<LoginInfo>? get loginInfos {
    final value = _loginInfos;
    if (value == null) return null;
    if (_loginInfos is EqualUnmodifiableListView) return _loginInfos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'User(id: $id, role: $role, loginId: $loginId, password: $password, storeName: $storeName, ownerName: $ownerName, phone: $phone, status: $status, address: $address, x: $x, y: $y, subStores: $subStores, deliveryMen: $deliveryMen, mainStore: $mainStore, employmentStore: $employmentStore, itemCategories: $itemCategories, items: $items, productions: $productions, orderSheets: $orderSheets, agreements: $agreements, loginInfos: $loginInfos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other.role, role) &&
            (identical(other.loginId, loginId) || other.loginId == loginId) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.storeName, storeName) ||
                other.storeName == storeName) &&
            (identical(other.ownerName, ownerName) ||
                other.ownerName == ownerName) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y) &&
            const DeepCollectionEquality()
                .equals(other._subStores, _subStores) &&
            const DeepCollectionEquality()
                .equals(other._deliveryMen, _deliveryMen) &&
            (identical(other.mainStore, mainStore) ||
                other.mainStore == mainStore) &&
            (identical(other.employmentStore, employmentStore) ||
                other.employmentStore == employmentStore) &&
            const DeepCollectionEquality()
                .equals(other._itemCategories, _itemCategories) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality()
                .equals(other._productions, _productions) &&
            const DeepCollectionEquality()
                .equals(other._orderSheets, _orderSheets) &&
            const DeepCollectionEquality()
                .equals(other._agreements, _agreements) &&
            const DeepCollectionEquality()
                .equals(other._loginInfos, _loginInfos));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        const DeepCollectionEquality().hash(role),
        loginId,
        password,
        storeName,
        ownerName,
        phone,
        const DeepCollectionEquality().hash(status),
        address,
        x,
        y,
        const DeepCollectionEquality().hash(_subStores),
        const DeepCollectionEquality().hash(_deliveryMen),
        mainStore,
        employmentStore,
        const DeepCollectionEquality().hash(_itemCategories),
        const DeepCollectionEquality().hash(_items),
        const DeepCollectionEquality().hash(_productions),
        const DeepCollectionEquality().hash(_orderSheets),
        const DeepCollectionEquality().hash(_agreements),
        const DeepCollectionEquality().hash(_loginInfos)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User extends User {
  factory _User(
      {final int? id,
      required final dynamic role,
      required final String loginId,
      final String? password,
      final String? storeName,
      required final String ownerName,
      required final String phone,
      required final dynamic status,
      final String? address,
      final String? x,
      final String? y,
      final List<User>? subStores,
      final List<User>? deliveryMen,
      final User? mainStore,
      final User? employmentStore,
      final List<ItemCategory>? itemCategories,
      final List<Item>? items,
      final List<Product>? productions,
      final List<OrderSheet>? orderSheets,
      final List<Agreement>? agreements,
      final List<LoginInfo>? loginInfos}) = _$UserImpl;
  _User._() : super._();

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  int? get id;
  @override
  dynamic get role;
  @override
  String get loginId;
  @override
  String? get password;
  @override
  String? get storeName;
  @override
  String get ownerName;
  @override
  String get phone;
  @override
  dynamic get status;
  @override
  String? get address;
  @override
  String? get x;
  @override
  String? get y;
  @override
  List<User>? get subStores;
  @override
  List<User>? get deliveryMen;
  @override
  User? get mainStore;
  @override
  User? get employmentStore;
  @override
  List<ItemCategory>? get itemCategories;
  @override
  List<Item>? get items;
  @override
  List<Product>? get productions;
  @override
  List<OrderSheet>? get orderSheets;
  @override
  List<Agreement>? get agreements;
  @override
  List<LoginInfo>? get loginInfos;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
