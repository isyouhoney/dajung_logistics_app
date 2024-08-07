import 'package:bakery_app/models/order_item.dart';
import 'package:bakery_app/viewmodels/item_service.dart';
import 'package:bakery_app/viewmodels/order_service.dart';
import 'package:bakery_app/widgets/custom_dropdown.dart';
import 'package:bakery_app/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddOrderItem extends StatefulWidget {
  const AddOrderItem({super.key,});

  @override
  State<AddOrderItem> createState() => _AddOrderItemState();
}

class _AddOrderItemState extends State<AddOrderItem> {
  List<dynamic> categoryList=[];
  RxList<String> categoryNameList = ['카테고리'].obs;
  List<dynamic> itemList=[];
  RxList<String> itemNameList = ['제품명'].obs;

  @override
  void initState() {
    super.initState();
    getCategoryNameList();
  }

  @override
  void dispose() {
    ItemService.to.addItemCategory.value = '카테고리';
    ItemService.to.addItemName.value = '제품명';
    super.dispose();
  }

  Future getCategoryNameList() async {
    categoryList = (await ItemService.to.fetchCategories())!;
    for (var e in categoryList) {
      categoryNameList.add(e.categoryName);
    }
    itemList = (await ItemService.to.fetchItems())!;
  }

  Future getItemNameList(String category) async {
    List<String> newList = ['제품명'];
    List<String> orderItemNames = OrderService.to.dailyOrderList.map((orderItem) => orderItem.item.itemName).toList();

    for (var e in itemList) {
      if(e.category.categoryName == category  && !orderItemNames.contains(e.itemName)) {
        newList.add(e.itemName);
      }
    }
    itemNameList.value = newList;
  }

  @override
  Widget build(BuildContext context) {
        return AlertDialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 20),
          titlePadding: const EdgeInsets.only(top: 20),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16))),
          actionsPadding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
          title: const Center(child: Text('주문할 상품 추가', style: TextStyle(fontSize: 18),)),
          content: SingleChildScrollView(
            child: Row(children: [
              Obx(()=>CustomDropdown(list: categoryNameList.value, selectedValue: ItemService.to.addItemCategory,
                  onChange:(value){
                ItemService.to.addItemName.value = '제품명';
                getItemNameList(value);},width: 38.w)),
              const SizedBox(width: 10),
          Obx(()=>CustomDropdown(list: itemNameList.value, selectedValue: ItemService.to.addItemName, width: 38.w)),
            ],),
          ),
          actions: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
            CW.textButton('취소',onPressed: () => Navigator.of(context).pop(), width: 38.w, height: 40, color: Colors.grey),
            CW.textButton('확인', onPressed: () async {
              for (var e in itemList) {
                if(e.itemName == ItemService.to.addItemName.value) {
                  OrderService.to.dailyOrderList.value = List.from(OrderService.to.dailyOrderList.value)..insert(OrderService.to.dailyOrderList.length,OrderItem(item: e, quantity: 0));
                }
              }
              Get.back();
                  OrderService.to.isChanged.value = true;
              }, width: 38.w, height: 40)])
          ],
        );
  }
}
