import 'package:bakery_app/widgets/custom_textfield.dart';
import 'package:bakery_app/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
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
      CustomTextField(hintText: '', width: 33.w, height: 40),
      const Text('~'),
      CustomTextField(hintText: '', width: 33.w, height: 40),
      CW.textButton('적용', color: Colors.grey, textColor: Colors.white, width: 80, height: 40, radius: 10, onPressed: (){}),
    ],);
  }
}
