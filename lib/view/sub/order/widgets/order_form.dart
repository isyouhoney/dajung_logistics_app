import 'package:bakery_app/utils/themeData.dart';
import 'package:bakery_app/view/main/item/item_detail.dart';
import 'package:bakery_app/widgets/add_item_button.dart';
import 'package:bakery_app/widgets/custom_container.dart';
import 'package:bakery_app/widgets/custom_dropdown.dart';
import 'package:bakery_app/widgets/custom_widget.dart';
import 'package:bakery_app/widgets/item_field_layout.dart';
import 'package:flutter/material.dart';

class OrderForm extends StatelessWidget {
  const OrderForm({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(child:
    // ListView.builder(itemBuilder: itemBuilder)
      Column(children: [
        orderItem(context),
        orderItem(context),
        orderItem(context),
        orderItem(context),
        AddItemButton()
      ],)
    );
  }

  Widget orderItem(BuildContext context){
    return ItemFieldLayout(name: '올리브 치아바타',
        mainWidget: Column(children: [
          CustomDropdown(width: 80,height: 40,),
          Text('재고 : 10EA', style: TextStyle(color: CC.errorColor),)
        ],),
        subWidget:CW.textButton('상세', width: 60, height: 40, color: CC.mainColor, radius: 10,
              // onPressed: () => showDialog(context: context, builder: (ctx) => ItemDetail())
    ),
        );
  }
}
