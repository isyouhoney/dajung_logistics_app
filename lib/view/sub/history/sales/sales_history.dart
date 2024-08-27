import 'package:bakery_app/utils/themeData.dart';
import 'package:bakery_app/view/sub/history/sales/sales_calendar.dart';
import 'package:bakery_app/viewmodels/report_service.dart';
import 'package:bakery_app/widgets/custom_container.dart';
import 'package:bakery_app/widgets/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';
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
    ReportService.to.getOrderHistory(selectDay.value);
  }



  @override
  Widget build(BuildContext context) {
    return DefaultLayout(title: '판매 내역', child: SingleChildScrollView(child: Column(children: [
      CustomContainer(width:100.w, color: CC.backgroundColor, child: Padding(
        padding: const EdgeInsets.all(4),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Center(child: Obx(()=>Text('${selectDay.value.month}월 판매 내역', style: Theme.of(context).textTheme.titleMedium))),
          Obx(() => Text('총액 : ${NumberFormat('###,###,###,###').format(ReportService.to.totalAmount.value)} 원', style: Theme.of(context).textTheme.titleSmall?.copyWith(height: 1.8))),
            Obx(() => Text('정산 예정금액 : ${NumberFormat('###,###,###,###').format(ReportService.to.settlementAmount.value)} 원', style: Theme.of(context).textTheme.titleSmall?.copyWith(height: 1.4))),
              Obx(() => Text('일 평균 매출 : ${NumberFormat('###,###,###,###').format(ReportService.to.dayAverageAmount.value)} 원', style: Theme.of(context).textTheme.titleSmall?.copyWith(height: 1.4))),
        ],),
      )),
      SalesCalendar(selectDay: selectDay, focusDay: focusDay),

    ],),));
  }
}
