import 'package:bakery_app/utils/themeData.dart';
import 'package:bakery_app/viewmodels/order_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';

class DateSelector extends StatefulWidget {
  const DateSelector({super.key, required this.dateChanged});
  final ValueChanged<DateTime> dateChanged;

  @override
  State<DateSelector> createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      IconButton(onPressed: () {
        OrderService.to.selectDay.value = OrderService.to.selectDay.value.subtract(const Duration(days: 1));
        widget.dateChanged(OrderService.to.selectDay.value);
      }, icon: const Icon(Icons.arrow_back_ios)),
      Obx(()=>TextButton(child: Text(DateFormat('yyyy-MM-dd').format(OrderService.to.selectDay.value), style: TextStyle(color: CC.mainColor),),
        onPressed: () async {
          final DateTime? dateTime = await showDatePicker(
              context: context,
              initialDate: OrderService.to.selectDay.value,
              firstDate: DateTime(2024),
              lastDate: DateTime(3000));
          if (dateTime != null) {
            OrderService.to.selectDay.value = dateTime;
            widget.dateChanged(OrderService.to.selectDay.value);
          }
        })),
      IconButton(onPressed: () => OrderService.to.selectDay.value = OrderService.to.selectDay.value.add(const Duration(days: 1)), icon: const Icon(Icons.arrow_forward_ios)),
    ],);
  }
}
