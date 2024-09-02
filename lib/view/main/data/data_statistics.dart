import 'package:bakery_app/utils/themeData.dart';
import 'package:bakery_app/viewmodels/report_service.dart';
import 'package:bakery_app/widgets/custom_dropdown.dart';
import 'package:bakery_app/widgets/custom_widget.dart';
import 'package:bakery_app/widgets/date_picker.dart';
import 'package:bakery_app/widgets/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class DataStatistics extends StatefulWidget {
  const DataStatistics({super.key});

  @override
  State<DataStatistics> createState() => _DataStatisticsState();
}

class _DataStatisticsState extends State<DataStatistics> {
  RxMap sort = {'오늘':true, '1주일':false, '1개월':false, '3개월':false}.obs;

  void switcher(String range) {
    switch (range) {
      case '오늘':
        ReportService.to.startDate.value = DateTime.now();
        ReportService.to.endDate.value = DateTime.now().add(const Duration(days: 1));
        break;
      case '1주일':
        ReportService.to.startDate.value = DateTime.now().subtract(const Duration(days: 7));
        ReportService.to.endDate.value = DateTime.now().add(const Duration(days: 1));
        break;
      case '1개월':
        ReportService.to.startDate.value = DateTime.now().subtract(const Duration(days: 30));
        ReportService.to.endDate.value = DateTime.now().add(const Duration(days: 1));
        break;
      case '3개월':
        ReportService.to.startDate.value = DateTime.now().subtract(const Duration(days: 90));
        ReportService.to.endDate.value = DateTime.now().add(const Duration(days: 1));
        break;
      default:
        print('no match');
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '데이터 통계',
      bottomSheet: CW.textButton('공유하기', onPressed: (){}),
      child: Column(children: [
            Obx(() => Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children:
              sort.value.entries.map<Widget>((entry) => CW.textButton(entry.key, color: entry.value ? CC.mainColor : CC.subColor, textColor: entry.value ? Colors.white : CC.mainColor, width: 80, height: 40, radius: 8,
                  onPressed: (){
                sort.keys.forEach((e) => sort[e] = false);
                sort[entry.key] = true;

                  })).toList(),
            )),
            const SizedBox(height: 10),
            const DatePicker(),
            // const CustomDropdown(),
            // Table()
          ]),
    );
  }
}
