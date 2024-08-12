import 'package:bakery_app/utils/enums.dart';
import 'package:bakery_app/view/sub/history/delivery/delivery_check.dart';
import 'package:bakery_app/viewmodels/delivery_service.dart';
import 'package:bakery_app/widgets/custom_container.dart';
import 'package:bakery_app/widgets/custom_dropdown.dart';
import 'package:bakery_app/widgets/custom_widget.dart';
import 'package:bakery_app/widgets/default_layout.dart';
import 'package:bakery_app/widgets/quantity_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class DeliveryHistory extends StatefulWidget {
  const DeliveryHistory({super.key});

  @override
  State<DeliveryHistory> createState() => _DeliveryHistoryState();
}

class _DeliveryHistoryState extends State<DeliveryHistory> {
  List listAll = [];
  RxList orderList = [].obs;
  RxString selectedStatus = DeliveryStatus.all.kor.obs;
  int skip = 0;
  int take = 10;

  @override
  void initState() {
    super.initState();
    getOrderHistory();
  }

  void getOrderHistory() async {
    listAll = (await DeliveryService.to.fetchDeliveryHistory(skip, take))!;
    orderList.value = listAll;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(title: '배송 내역', child: SingleChildScrollView(child: Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: CustomDropdown(list: DeliveryStatus.values.map((fruit) => fruit.kor).toList(), selectedValue: selectedStatus,
          onChange: (value){
            List newList =[];
            listAll.forEach((e){
              e['status'] == value ? newList.add(e) : null;
            });
            orderList.value = newList;
          }),
      ),
      Obx(()=>orderList!=[] ? Column(children: orderList.map((order)=>deliveryCard(order)).toList()) :
      const CustomContainer(child: Text('내역이 없습니다.')))
      ,
    ],),));
  }

  Widget deliveryCard(order){
    return CustomContainer(child: Padding(
      padding: const EdgeInsets.only(left: 5),
      child:
          Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
              Text(order['date'], style: Theme.of(context).textTheme.titleMedium,),
              QuantityField(content: '배송 미완료', width: 100, radius: 25, padding: 0,fontSize: 15,)]),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.center, children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('총 주문 갯수 : ${order['totalOrderAmount']}', style: Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(height: 5,),
                  Text('총 회수 갯수 : ${order['totalRecallAmount']}', style: Theme.of(context).textTheme.bodyLarge),
                    ],),
                CW.textButton('상세 보기', width: 100, height: 40, radius: 25, onPressed: () => Get.to(() => DeliveryCheck(orderDate: order['date'], totalOrderAmount: order['totalOrderAmount'], totalRecallAmount: order['totalRecallAmount'])))
              ],),
            )
      ]),
    ));
  }
}
