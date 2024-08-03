import 'package:bakery_app/models/item.dart';
import 'package:bakery_app/models/order_item.dart';
import 'package:bakery_app/viewmodels/item_service.dart';
import 'package:bakery_app/viewmodels/request_service.dart';
import 'package:bakery_app/widgets/custom_dropdown.dart';
import 'package:bakery_app/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RequestAdditionalItem extends StatefulWidget {
  const RequestAdditionalItem({super.key});

  @override
  State<RequestAdditionalItem> createState() => _RequestAdditionalItemState();
}

class _RequestAdditionalItemState extends State<RequestAdditionalItem> {
  List<dynamic> itemList=[];
  RxList<String> itemNameList = ['제품명'].obs;
  RxString quantity = '0'.obs;
  Rx<Item?> selectedItem = Rx<Item?>(null);

  @override
  void initState() {
    getItemNameList();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    quantity.value = '0';
    selectedItem.value = null;
    ItemService.to.addItemName.value = '제품명';
  }

  Future getItemNameList() async {
    itemList = (await ItemService.to.fetchItems())!;
      for (var e in itemList) {
        itemNameList.add(e.itemName);
      }
    print(itemNameList);
  }

  @override
  Widget build(BuildContext context) {
    RxList<String> numbers = List.generate(100, (index) => index.toString()).obs;

        return AlertDialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 0),
          titlePadding: const EdgeInsets.only(top: 20),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16))),
          actionsPadding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
          title: const Center(child: Text('제품 요청', style: TextStyle(fontSize: 18),)),
          content: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Obx(()=>CustomDropdown(list: itemNameList.value, selectedValue: ItemService.to.addItemName, width: 50.w,
                )),
            const SizedBox(width: 10),
            CustomDropdown(width: 30.w, list: numbers, selectedValue: quantity),
            ],),
          actions: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
            CW.textButton('취소',onPressed: ()=>Navigator.of(context).pop(), width: 35.w,height: 40, color: Colors.grey),
            CW.textButton('요청', onPressed: () {
              print('ItemService.to.addItemName : ${ItemService.to.addItemName}');
              itemList.forEach((value){
                if(value.itemName == ItemService.to.addItemName.value) {selectedItem.value = value;}});
              print('selectedItem.value : ${selectedItem.value}');
              if (selectedItem.value != null) {
                RequestService.to.postRequest(OrderItem(item: selectedItem.value!, quantity: double.parse(quantity.value)));
                Get.back();
              } else {
                Get.snackbar('오류', '제품을 선택해주세요');
              }
            }, width: 35.w, height: 40)],)
          ],
        );
  }
}
