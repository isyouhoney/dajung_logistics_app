// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: (json['id'] as num?)?.toInt(),
      role: json['role'],
      loginId: json['loginId'] as String,
      password: json['password'] as String?,
      storeName: json['storeName'] as String?,
      ownerName: json['ownerName'] as String,
      phone: json['phone'] as String,
      status: json['status'],
      address: json['address'] as String?,
      x: json['x'] as String?,
      y: json['y'] as String?,
      subStores: (json['subStores'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      deliveryMen: (json['deliveryMen'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      mainStore: json['mainStore'] == null
          ? null
          : User.fromJson(json['mainStore'] as Map<String, dynamic>),
      employmentStore: json['employmentStore'] == null
          ? null
          : User.fromJson(json['employmentStore'] as Map<String, dynamic>),
      itemCategories: (json['itemCategories'] as List<dynamic>?)
          ?.map((e) => ItemCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      productions: (json['productions'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      orderSheets: (json['orderSheets'] as List<dynamic>?)
          ?.map((e) => OrderSheet.fromJson(e as Map<String, dynamic>))
          .toList(),
      agreements: (json['agreements'] as List<dynamic>?)
          ?.map((e) => Agreement.fromJson(e as Map<String, dynamic>))
          .toList(),
      loginInfos: (json['loginInfos'] as List<dynamic>?)
          ?.map((e) => LoginInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'role': instance.role,
      'loginId': instance.loginId,
      'password': instance.password,
      'storeName': instance.storeName,
      'ownerName': instance.ownerName,
      'phone': instance.phone,
      'status': instance.status,
      'address': instance.address,
      'x': instance.x,
      'y': instance.y,
      'subStores': instance.subStores,
      'deliveryMen': instance.deliveryMen,
      'mainStore': instance.mainStore,
      'employmentStore': instance.employmentStore,
      'itemCategories': instance.itemCategories,
      'items': instance.items,
      'productions': instance.productions,
      'orderSheets': instance.orderSheets,
      'agreements': instance.agreements,
      'loginInfos': instance.loginInfos,
    };
