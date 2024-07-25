import 'package:bakery_app/utils/themeData.dart';
import 'package:bakery_app/view/main/item/add_item.dart';
import 'package:bakery_app/viewmodels/item_service.dart';
import 'package:bakery_app/widgets/add_item_button.dart';
import 'package:bakery_app/widgets/custom_container.dart';
import 'package:bakery_app/widgets/custom_widget.dart';
import 'package:bakery_app/view/main/item/item_field.dart';
import 'package:bakery_app/widgets/default_layout.dart';
import 'package:flutter/material.dart';

class ItemManagement extends StatelessWidget {
  const ItemManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '상품 관리',
      bottomSheet: CW.textButton('저장'),
      child: CustomContainer(
        child: Column(children: [
          FutureBuilder(
              future: ItemService.to.fetchItems(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(child: Text("오류가 발생했습니다."));
                }
                print(snapshot.data);
                return ItemField(name: '소금빵');
              }),
          // Expanded(
          //   child: ListView.builder(
          //     shrinkWrap: true,
          //     physics: const NeverScrollableScrollPhysics(),
          //     itemBuilder: (BuildContext context, int index) {
          //     return ItemField(name: '상품명');
          //   },),
          // ),
          const ItemField(name: '소금빵'),
          const ItemField(name: '대파크림치즈 소금빵'),
          const ItemField(name: '초코 소금빵'),
          const ItemField(name: '치아바타'),
          AddItemButton()
        ]),
      ),
    );
  }
}
