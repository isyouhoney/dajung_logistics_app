// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductionImpl _$$ProductionImplFromJson(Map<String, dynamic> json) =>
    _$ProductionImpl(
      productionDate: json['productionDate'] as String,
      orders: Order.fromJson(json['orders'] as Map<String, dynamic>),
      mainStore: json['mainStore'] as String,
      products: json['products'] as String,
    );

Map<String, dynamic> _$$ProductionImplToJson(_$ProductionImpl instance) =>
    <String, dynamic>{
      'productionDate': instance.productionDate,
      'orders': instance.orders,
      'mainStore': instance.mainStore,
      'products': instance.products,
    };
