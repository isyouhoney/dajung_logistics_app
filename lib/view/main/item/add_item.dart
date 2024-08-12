import 'package:bakery_app/models/item.dart';
import 'package:bakery_app/models/item_category.dart';
import 'package:bakery_app/repositories/s3_repository.dart';
import 'package:bakery_app/utils/themeData.dart';
import 'package:bakery_app/viewmodels/item_service.dart';
import 'package:bakery_app/widgets/custom_dropdown.dart';
import 'package:bakery_app/widgets/custom_textfield.dart';
import 'package:bakery_app/widgets/custom_widget.dart';
import 'package:bakery_app/widgets/image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key, this.item});
  final Item? item;

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
    ItemService.to.addItemCategory.value = '카테고리';
    super.dispose();
  }

  Future getCategoryNameList() async {
    categoryList = (await ItemService.to.fetchCategories())!;
    for (var e in categoryList) {
      categoryNameList.add(e.categoryName);
    }
  }

  Future postItem() async{
    ItemCategory category = ItemCategory(id: 0, categoryName: ItemService.to.addItemCategory!.value);
    categoryList.forEach((e){if(e.categoryName==ItemService.to.addItemCategory?.value) category = e;});
    await S3Repository.to.getPresignedUrl();
    await ItemService.to.addItem(
        Item(itemName: itemNameController.text, price: int.parse(priceController.text),
            image: S3Repository.to.objectUrl, description: descriptionController.text, category: category));
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
              Obx(()=>CustomDropdown(list: categoryNameList.value, selectedValue: ItemService.to.addItemCategory)),
              const CustomImagePicker(),
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
            CW.textButton('확인', onPressed: () async {
              await postItem();
              Get.back();
              ItemService.to.fetchItems();
              }, width: 35.w, height: 40)])
          ],
        );
  }
}
