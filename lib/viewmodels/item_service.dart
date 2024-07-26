import 'package:bakery_app/models/item.dart';
import 'package:bakery_app/repositories/item_repository.dart';
import 'package:get/get.dart';

class ItemService extends GetxService {
  final ItemRepository itemRepository = ItemRepository();
  static ItemService get to => Get.find();
  final RxString addItemCategory = '카테고리'.obs;
  final addItemImage = ''.obs;

  Future<List?> fetchItems() async {
    var fetchedItems = await itemRepository.getItems();
    if (fetchedItems != null){
      return fetchedItems;
    } else {
      print('제품목록을 불러오는데 실패했습니다.');
    }
  }
  Future<List?> fetchCategories() async {
    var fetchedCategories = await itemRepository.getCategories();
    if (fetchedCategories != null){
      return fetchedCategories;
    } else {
      print('카테고리 목록을 불러오는데 실패했습니다.');
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