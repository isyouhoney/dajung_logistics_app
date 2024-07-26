import 'package:bakery_app/models/item.dart';
import 'package:bakery_app/models/item_category.dart';
import 'package:bakery_app/utils/themeData.dart';
import 'package:bakery_app/viewmodels/auth_service.dart';
import 'package:bakery_app/viewmodels/item_service.dart';
import 'package:bakery_app/widgets/custom_dropdown.dart';
import 'package:bakery_app/widgets/custom_textfield.dart';
import 'package:bakery_app/widgets/custom_widget.dart';
import 'package:bakery_app/widgets/image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
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
  RxList<String> categoryNameList = ['카테고리'].obs;
  List<dynamic> categoryList=[];
  RxBool subStore = false.obs;

  @override
  void initState() {
    super.initState();
    getCategoryNameList();
    itemNameController = TextEditingController();
    priceController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    itemNameController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  Future getCategoryNameList() async{
    categoryList = (await ItemService.to.fetchCategories())!;
    for (var e in categoryList) {
      categoryNameList.add(e.categoryName);
    }
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
              CustomDropdown(list: categoryNameList.value, selectedValue: ItemService.to.addItemCategory),//, selectedValue: ItemService.to.addItemCategory),
              CustomImagePicker(),
              CustomTextField(hintText: '가격', controller: priceController),
              CustomTextField(hintText: '상세 설명', controller: descriptionController, maxLine: 5,counterText: true,),
              Obx(()=>Row(
                children: [
                  Checkbox(value: subStore.value, onChanged: (value) => subStore.value = value!, materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, activeColor: CC.mainColor),
                  Text('가맹점 메뉴', style: Theme.of(context).textTheme.titleSmall)
                ],
              ),)
            ],),
          ),
          actions: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
            CW.textButton('취소',onPressed: ()=>Navigator.of(context).pop(), width: 35.w, height: 40, color: Colors.grey),
            CW.textButton('확인', onPressed: (){
              ItemCategory category = ItemCategory(id: 0, categoryName: ItemService.to.addItemCategory!.value);
                  categoryList.forEach((e){if(e.categoryName==ItemService.to.addItemCategory?.value) category = e;});
              ItemService.to.addItem(Item(itemName: itemNameController.text, price: int.parse(priceController.text), images: ItemService.to.addItemImage.value, description: descriptionController.text, category: category));
            Get.back();
            setState(() {});
              }, width: 35.w, height: 40)])
          ],
        );
  }
}
