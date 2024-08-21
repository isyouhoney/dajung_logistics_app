import 'package:bakery_app/models/order.dart';
import 'package:bakery_app/utils/themeData.dart';
import 'package:bakery_app/view/main/stock/stock_field.dart';
import 'package:bakery_app/viewmodels/delivery_service.dart';
import 'package:bakery_app/widgets/custom_container.dart';
import 'package:bakery_app/widgets/custom_widget.dart';
import 'package:bakery_app/widgets/default_layout.dart';
import 'package:bakery_app/widgets/storename_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class DeliveryCheck extends StatefulWidget {
  const DeliveryCheck({super.key, required this.orderDate, required this.totalOrderAmount, required this.totalRecallAmount});
  final String orderDate;
  final int totalOrderAmount;
  final int totalRecallAmount;

  @override
  State<DeliveryCheck> createState() => _DeliveryCheckState();
}

class _DeliveryCheckState extends State<DeliveryCheck> {
  Order? order;
  RxBool isChecked = false.obs;

  @override
  void initState() {
    super.initState();
    getData(widget.orderDate);
  }

  void getData(String orderDate) async {
    DateTime today = DateTime.parse(orderDate);
    DateTime yesterday = DateTime.parse(orderDate).subtract(const Duration(days: 1));
    Order? fetchedOrder = await DeliveryService.to.fetchDeliveryDetail(today, yesterday);
    if (mounted) {
      setState(() {order = fetchedOrder;});
    }
    if(order?.status == '배송확인') isChecked.value = true;
  }

  Future<bool?> checkDelivery()async {
    if(order?.status == '배송완료' && isChecked.value == false) {
      // print('order!.orderDate : ${order!.orderDate}');
      bool value = await DeliveryService.to.checkDelivery(DateTime.parse(order!.orderDate!));
      await DeliveryService.to.fetchDeliveryHistory(0, 20);
      return value;
    } return false;
  }
  
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(title: '배송 확인',
        bottomSheet: Obx(() => CW.textButton(order?.status == '배송완료' ? '배송 확인': isChecked.value ? '배송 완료' : '배송 준비중',
            color: isChecked.value || order?.status != '배송완료'? Colors.grey : CC.mainColor,
            onPressed: () => !isChecked.value ? checkDelivery().then((value) => isChecked.value = value!):null)),
        child: order == null ? const Center(child: CircularProgressIndicator()) :
          SingleChildScrollView(
            child: Column(children: [Padding(padding: const EdgeInsets.only(left: 20),
                  child: StorenameField(name: order!.orderDate!, preIcon: Icons.calendar_month, child: const SizedBox()),),
                CustomContainer(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Padding(padding: const EdgeInsets.fromLTRB(5,5,15,5),
                    child: StorenameField(name: '주문 내역', preIcon: Icons.receipt_long, iconColor: CC.mainColor,
                        child: Text('총 ${widget.totalOrderAmount} 개', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey))),),
                  order!.orderSheet != null ? Column(children: order!.orderSheet!.orderItems.map((orderItem) => StockField(name: orderItem!.item.itemName, quantity: orderItem.quantity)).toList()) : const SizedBox(),
                  order!.images != null ? imageList(order!.images!) : const SizedBox(),
                  order!.recall != null ? Column(
                    children: [
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5,5,15,5),
                        child: StorenameField(name: '회수 내역', preIcon: Icons.remove_circle_outline, iconColor: CC.redColor,
                            child: Text('총 ${widget.totalRecallAmount} 개', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey))),
                      ),
                      Column(children: order!.recall!.recallItems.map((recallItem) => StockField(name: recallItem.item.itemName, quantity: recallItem.quantity)).toList()),
                      imageList(order!.recall!.images)
                    ],
                  ):const SizedBox(),
                ],),
                ),
              ],
            ),
          ));
  }

  Widget imageList(List imageList){
    return GridView.builder(
      shrinkWrap: true,
      itemCount: imageList.length,
      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
        childAspectRatio: 1 / 1, //item 의 가로 1, 세로 1 의 비율
        mainAxisSpacing: 10, //수평 Padding
        crossAxisSpacing: 10, //수직 Padding
      ),
      itemBuilder: (BuildContext context,int index){
        // return Text(index.toString());
        return  Container(height: 200, padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey.shade400,
            ),
          ),
          child: Image.network(imageList[index])
        );
      },
    );
  }
}
