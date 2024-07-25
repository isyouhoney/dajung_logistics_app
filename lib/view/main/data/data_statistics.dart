import 'package:bakery_app/utils/themeData.dart';
import 'package:bakery_app/widgets/custom_dropdown.dart';
import 'package:bakery_app/widgets/custom_widget.dart';
import 'package:bakery_app/widgets/date_picker.dart';
import 'package:bakery_app/widgets/default_layout.dart';
import 'package:flutter/material.dart';

class DataStatistics extends StatefulWidget {
  const DataStatistics({super.key});

  @override
  State<DataStatistics> createState() => _DataStatisticsState();
}

class _DataStatisticsState extends State<DataStatistics> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '데이터 통계',
      bottomSheet: CW.textButton('엑셀 다운로드'),
      child:
        Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              CW.textButton('오늘', color: CC.subColor, textColor: CC.mainColor, width: 80, height: 40, radius: 8, onPressed: (){}),
              CW.textButton('1주일', color: CC.subColor, textColor: CC.mainColor, width: 80, height: 40, radius: 8, onPressed: (){}),
              CW.textButton('1개월', color: CC.subColor, textColor: CC.mainColor, width: 80, height: 40, radius: 8, onPressed: (){}),
              CW.textButton('3개월', color: CC.subColor, textColor: CC.mainColor, width: 80, height: 40, radius: 8, onPressed: (){}),
            ],),
            const SizedBox(height: 10),
            const DatePicker(),
            const CustomDropdown(),
            Table()
          ]),
    );
  }
}
