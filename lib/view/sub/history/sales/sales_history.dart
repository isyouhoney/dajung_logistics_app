import 'package:bakery_app/utils/themeData.dart';
import 'package:bakery_app/view/sub/history/sales/sales_calendar.dart';
import 'package:bakery_app/viewmodels/order_service.dart';
import 'package:bakery_app/widgets/custom_container.dart';
import 'package:bakery_app/widgets/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SalesHistory extends StatefulWidget {
  const SalesHistory({super.key});

  @override
  State<SalesHistory> createState() => _SalesHistoryState();
}

class _SalesHistoryState extends State<SalesHistory> {
  Rx<DateTime> selectDay = DateTime.now().obs;
  Rx<DateTime> focusDay = DateTime.now().obs;
  @override
  void initState() {
    super.initState();
    getOrderHistory(selectDay.value);
  }

  void getOrderHistory(DateTime selectedDay) async {
    DateTime firstDayOfMonth = DateTime(selectedDay.year, selectedDay.month, 1);
    DateTime firstDayOfNextMonth = (selectedDay.month < 12)
        ? DateTime(selectedDay.year, selectedDay.month + 1, 1)
        : DateTime(selectedDay.year + 1, 1, 1);
    // DateTime lastDayOfMonth = firstDayOfNextMonth.subtract(const Duration(days: 1));

    await OrderService.to.fetchDayOrderHistory(firstDayOfMonth, firstDayOfNextMonth);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(title: '판매 내역', isPadded:false, child: SingleChildScrollView(child: Column(children: [
      CustomContainer(width:100.w, color: CC.backgroundColor, child: Padding(
        padding: const EdgeInsets.all(4),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Center(child: Obx(()=>Text('${selectDay.value.month}월 판매 내역', style: Theme.of(context).textTheme.titleMedium))),
          Text('총액 : 10,000,000 원', style: Theme.of(context).textTheme.titleSmall?.copyWith(height: 1.8)),
          Text('정산 예정금액 : 9,999,999 원', style: Theme.of(context).textTheme.titleSmall?.copyWith(height: 1.4)),
          Text('일 평균 매출 : 500,000원', style: Theme.of(context).textTheme.titleSmall?.copyWith(height: 1.4)),
        ],),
      )),
      SalesCalendar(selectDay: selectDay, focusDay: focusDay,),

    ],),));
  }
}
