import 'package:bakery_app/viewmodels/report_service.dart';
import 'package:bakery_app/widgets/custom_textfield.dart';
import 'package:bakery_app/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({super.key});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      dateField(ReportService.to.startDate.value),
      const Text('~'),
      dateField(ReportService.to.endDate.value),
      CW.textButton('적용', color: Colors.grey, textColor: Colors.white, width: 80, height: 40, radius: 10, onPressed: (){}),
    ],);
  }

  Widget dateField(DateTime day){
    return Obx(() => GestureDetector(
        onTap: (){},
        child: CustomTextField(hintText: DateFormat('yyyy-MM-dd').format(day).toString(), width: 33.w, height: 40)));

  }
}
