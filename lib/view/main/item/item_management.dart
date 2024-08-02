import 'package:bakery_app/viewmodels/item_service.dart';
import 'package:bakery_app/widgets/add_item_button.dart';
import 'package:bakery_app/widgets/custom_container.dart';
import 'package:bakery_app/view/main/item/item_field.dart';
import 'package:bakery_app/widgets/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ItemManagement extends StatefulWidget {
  const ItemManagement({super.key});

  @override
  State<ItemManagement> createState() => _ItemManagementState();
}

class _ItemManagementState extends State<ItemManagement> {
  @override
  void initState() {
    super.initState();
    ItemService.to.fetchItems();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '상품 관리',
      child: CustomContainer(
        width: 100.w,
        child: Obx(()=>Column(children: [
          ItemService.to.ItemList != [] ?
          Column(children:ItemService.to.ItemList.map((e) => ItemField(item: e)).toList()):
          const SizedBox(),
          const AddItemButton()
        ])),
      ),
    );
  }
}
