import 'package:bakery_app/utils/enums.dart';
import 'package:bakery_app/utils/timeFormatting.dart';
import 'package:bakery_app/view/ride/widget/delivery_panel.dart';
import 'package:bakery_app/view/sub/order/widgets/day_of_week_selector.dart';
import 'package:bakery_app/viewmodels/delivery_service.dart';
import 'package:bakery_app/widgets/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';

class DeliveryList extends StatefulWidget {
  const DeliveryList({super.key});

  @override
  State<DeliveryList> createState() => _DeliveryListState();
}

class _DeliveryListState extends State<DeliveryList> {
  DayOfWeek? dayOfWeek = DayOfWeek.fromKor(DateFormat('E', 'ko_KR').format(DateTime.now()));

  @override
  void initState() {
    super.initState();
    getList();
  }

  Future getList() async {
    DeliveryService.to.deliveryList.value = [];
    // await OrderService.to.fetchOrderSheets();
    await DeliveryService.to.fetchDayOrders(dayOfWeek!);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(title: '요일별 배송리스트', child: SingleChildScrollView(child: Column(children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(dateFormat(DateTime.now().add(const Duration(days: 1))), style: Theme.of(context).textTheme.titleLarge),
      ),
      DayOfWeekSelector(dayOfWeek: (value) => dayOfWeek = value, onChange: (value) => getList()),
      Obx(() => Column(children: DeliveryService.to.deliveryList.map((orderSheet) => DeliveryPanel(orderSheet: orderSheet)).toList()))
    ],),));
  }
}
