import 'package:bakery_app/models/item.dart';
import 'package:bakery_app/models/item_category.dart';
import 'package:bakery_app/viewmodels/auth_service.dart';
import 'package:bakery_app/viewmodels/item_service.dart';
import 'package:bakery_app/widgets/custom_dropdown.dart';
import 'package:bakery_app/widgets/custom_textfield.dart';
import 'package:bakery_app/widgets/custom_widget.dart';
import 'package:bakery_app/widgets/image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  late TextEditingController itemNameController;
  late TextEditingController priceController;
  late TextEditingController descriptionController;
  late String image;
  late RxBool subStore;

  @override
  void initState() {
    super.initState();
    itemNameController = TextEditingController();
    priceController = TextEditingController();
    descriptionController = TextEditingController();
    subStore = false.obs;
  }

  @override
  void dispose() {
    itemNameController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    super.dispose();
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
          title: const Center(child: Text('상품 추가', style: TextStyle(fontSize: 18),)),
          content: SingleChildScrollView(
            child: Column(children: [
              CustomTextField(hintText: '상품명', controller: itemNameController),
              const CustomDropdown(),
              const CustomImagePicker(),
              CustomTextField(hintText: '가격', controller: priceController),
              CustomTextField(hintText: '상세 설명', controller: descriptionController, maxLine: 5,counterText: true,),
            ],),
          ),
          actions: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
            CW.textButton('취소',onPressed: ()=>Navigator.of(context).pop(), width: 35.w, height: 40, color: Colors.grey),
            CW.textButton('확인', onPressed: (){
            }, width: 35.w, height: 40)])
          ],
        );
  }
}
