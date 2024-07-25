import 'package:bakery_app/models/item.dart';
import 'package:bakery_app/repositories/item_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ItemService extends GetxService {
  final ItemRepository itemRepository = ItemRepository();
  static ItemService get to => Get.find();

  Future<List?> fetchItems() async {
    var fetchedItems = await itemRepository.getItems();
    if (fetchedItems != null){
      return fetchedItems;
    } else {
      print('제품목록을 불러오는데 실패했습니다.');
    }
  }

  Future<void> addItem(Item item) async {
    var addItem = await itemRepository.postItem(item);
    if (addItem != null){
      print(addItem);
    } else {
      print('제품 추가를 실패했습니다.');
    }
  }
}