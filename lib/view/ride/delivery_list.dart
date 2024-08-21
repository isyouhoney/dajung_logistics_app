import 'package:bakery_app/utils/enums.dart';
import 'package:bakery_app/utils/timeFormatting.dart';
import 'package:bakery_app/view/ride/widget/delivery_panel.dart';
import 'package:bakery_app/view/sub/order/widgets/day_of_week_selector.dart';
import 'package:bakery_app/viewmodels/delivery_service.dart';
import 'package:bakery_app/widgets/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class DeliveryList extends StatefulWidget {
  const DeliveryList({super.key});

  @override
  State<DeliveryList> createState() => _DeliveryListState();
}

class _DeliveryListState extends State<DeliveryList> {
  // DayOfWeek? dayOfWeek = DayOfWeek.fromKor(DateFormat('E', 'ko_KR').format(DateTime.now()));

  @override
  void initState() {
    super.initState();
    getList();
  }

  Future getList() async {
    DeliveryService.to.deliveryList.value = [];
    await DeliveryService.to.fetchDayOrders(DeliveryService.to.date.value);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(title: '이주의 배송리스트', child: SingleChildScrollView(child: Column(children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Obx(() => Text(dateFormat(DeliveryService.to.date.value), style: Theme.of(context).textTheme.titleLarge)),
      ),
      DayOfWeekSelector(onChange: (value) => getList()),
      Obx(() => DeliveryService.to.deliveryList.isNotEmpty ? Column(children: DeliveryService.to.deliveryList.map((orderSheet) => DeliveryPanel(orderSheet: orderSheet)).toList())
              :const Center(child: Padding(
          padding: EdgeInsets.only(top: 80),
      child: Text('배송 리스트가 없습니다.'),
    )))
    ],),));
  }
}
