import 'package:bakery_app/models/agreement.dart';
import 'package:bakery_app/models/item.dart';
import 'package:bakery_app/models/item_category.dart';
import 'package:bakery_app/models/login_info.dart';
import 'package:bakery_app/models/order_sheet.dart';
import 'package:bakery_app/models/product.dart';
import 'package:bakery_app/utils/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const User._();
  factory User({
    int? id,
    required dynamic role,
    required String loginId,
    String? password,
    String? storeName,
    required String ownerName,
    required String phone,
    required dynamic status,
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
    List<LoginInfo>? loginInfos,
}) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson({
    ...json,
    'role': Role.fromKor(json['role']),
  });
}