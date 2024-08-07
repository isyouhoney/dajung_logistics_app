import 'package:bakery_app/models/order_item.dart';
import 'package:bakery_app/utils/themeData.dart';
import 'package:bakery_app/view/main/item/item_detail.dart';
import 'package:bakery_app/view/sub/order/add_order_item.dart';
import 'package:bakery_app/viewmodels/order_service.dart';
import 'package:bakery_app/widgets/add_item_button.dart';
import 'package:bakery_app/widgets/custom_container.dart';
import 'package:bakery_app/widgets/custom_dropdown.dart';
import 'package:bakery_app/widgets/custom_widget.dart';
import 'package:bakery_app/widgets/item_field_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OrderForm extends StatefulWidget {
  const OrderForm({super.key});

  @override
  State<OrderForm> createState() => _OrderFormState();
}

class _OrderFormState extends State<OrderForm> {

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        width: 100.w,
        child: Column(children: [Obx(() => Column(children:
          OrderService.to.dailyOrderList.value.map((e) => orderItemWidget(context, e)).toList())),
          const AddItemButton(nextPage: AddOrderItem())],));
  }

  Widget orderItemWidget(BuildContext context, OrderItem orderItem) {
    RxList<String> numbers = List.generate(100, (index) => index.toString()).obs;

    return ItemFieldLayout(
        name: orderItem.item.itemName,
        mainWidget: CustomDropdown(width: 80, height: 40,
          list: numbers, selectedValue: orderItem.quantity.toString().obs,
          onChange: (quantity){
            final updatedList = OrderService.to.dailyOrderList.value.map((oItem) {
              if (oItem.item.itemName == orderItem.item.itemName) {
                return OrderItem(item: oItem.item, quantity: int.parse(quantity));
              }
              return oItem;
            }).toList();
            OrderService.to.dailyOrderList.value = updatedList;
            if(orderItem.quantity != int.parse(quantity)) OrderService.to.isChanged.value = true;
          },
        ),
        subWidget: Padding(padding: const EdgeInsets.symmetric(vertical: 5),
          child: CW.textButton('상세', width: 60, height: 40, color: CC.mainColor, radius: 10,
              onPressed: () => showDialog(context: context,
                  builder: (ctx) => ItemDetail(item: orderItem.item))),
        ));
  }
}
