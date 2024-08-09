import 'package:bakery_app/viewmodels/order_service.dart';
import 'package:bakery_app/widgets/custom_container.dart';
import 'package:bakery_app/widgets/custom_dropdown.dart';
import 'package:bakery_app/widgets/custom_widget.dart';
import 'package:bakery_app/widgets/default_layout.dart';
import 'package:bakery_app/widgets/quantity_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class DeliveryHistory extends StatefulWidget {
  const DeliveryHistory({super.key});

  @override
  State<DeliveryHistory> createState() => _DeliveryHistoryState();
}

class _DeliveryHistoryState extends State<DeliveryHistory> {
  RxList orderList = [].obs;

  @override
  void initState() {
    super.initState();
    getOrderHistory();
  }

  void getOrderHistory() async {
    orderList.value = (await OrderService.to.fetchDayOrderHistory(DateTime.now().subtract(const Duration(days: 10)), DateTime.now()))!;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(title: '배송 내역', child: SingleChildScrollView(child: Column(children: [
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: CustomDropdown(),
      ),
      deliveryCard(),
      deliveryCard(),
      deliveryCard(),
      deliveryCard(),
    ],),));
  }

  Widget deliveryCard(){
    return CustomContainer(child: Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Column(
        children: orderList.value.map((order)=>
          Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
              Text(order['date'], style: Theme.of(context).textTheme.titleMedium,),
              QuantityField(content: '배송 미완료', width: 100, radius: 25, padding: 0,fontSize: 15,)]),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.center, children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('총 주문 갯수 : ${order['data']['orderAmount']}', style: Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(height: 5,),
                  Text('총 회수 갯수 : ${order['data']['recallAmout']}', style: Theme.of(context).textTheme.bodyLarge),
                    ],),
                CW.textButton('상세 보기', width: 100, height: 40, radius: 25)
              ],),
            )])).toList(),
      ),
    ));
  }
}
