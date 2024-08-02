import 'package:bakery_app/models/order_item.dart';
import 'package:bakery_app/viewmodels/item_service.dart';
import 'package:bakery_app/viewmodels/request_service.dart';
import 'package:bakery_app/widgets/custom_dropdown.dart';
import 'package:bakery_app/widgets/custom_textfield.dart';
import 'package:bakery_app/widgets/custom_widget.dart';
import 'package:bakery_app/widgets/image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
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
  // late OrderItem requestItem;

  @override
  void initState() {
    super.initState();
    ItemService.to.fetchItems();
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
            CustomDropdown(list: itemNameList.value, selectedValue: ItemService.to.addItemName, onChange:(value){},width: 50.w),
            CustomDropdown(width: 30.w, list: numbers, selectedValue: quantity),
            ],),
          actions: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
            CW.textButton('취소',onPressed: ()=>Navigator.of(context).pop(), width: 35.w,  color: Colors.grey),
            CW.textButton('요청', onPressed: (){
              // RequestService.to.postRequest(OrderItem(item: item, quantity: double.parse(quantity.value)));
              Get.back();
            }, width: 35.w, height: 40)],)
          ],
        );
  }
}
