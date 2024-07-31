import 'package:bakery_app/models/item.dart';
import 'package:bakery_app/models/production.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  const Product._();
  factory Product({
    required Item item,
    required int total,
    int? inventory,
    Production? production,
}) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}