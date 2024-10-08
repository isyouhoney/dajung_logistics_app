import 'package:bakery_app/utils/enums.dart';
import 'package:bakery_app/utils/themeData.dart';
import 'package:bakery_app/viewmodels/delivery_service.dart';
import 'package:bakery_app/viewmodels/order_service.dart';
import 'package:bakery_app/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DayOfWeekSelector extends StatefulWidget {
  const DayOfWeekSelector({super.key, this.dayOfWeek, this.onChange});
  final ValueChanged<DayOfWeek>? dayOfWeek;
  final Function(DayOfWeek)? onChange;

  @override
  State<DayOfWeekSelector> createState() => _DayOfWeekSelectorState();
}

class _DayOfWeekSelectorState extends State<DayOfWeekSelector> {
  Rx<DayOfWeek?> selector = DayOfWeek.fromKor(DateFormat('E', 'ko_KR').format(DateTime.now())).obs;

  void onPressedDayOfWeek(DayOfWeek value){
    selector.value = value;

    DateTime now = DateTime.now();
    int currentWeekDay = now.weekday;
    DateTime monday = now.subtract(Duration(days: currentWeekDay - 1));

    DateTime selectedDate = monday.add(Duration(days: value.indexNumber));
    DeliveryService.to.date.value = selectedDate;

    if(widget.dayOfWeek != null) widget.dayOfWeek!(selector.value!);
    if(widget.onChange != null) widget.onChange!(value);
    OrderService.to.isChanged.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: DayOfWeek.values.map((value){
      return CW.textButton(value.kor, width: 12.w, height: 12.w,
          color: value == selector.value? CC.mainColor : Colors.white,
          textColor: value == selector.value? Colors.white : Colors.grey,
          borderColor: value == selector.value? Colors.transparent : Colors.grey,
          onPressed: () {
            if(!OrderService.to.isChanged.value){
              onPressedDayOfWeek(value);
            } else {
              CW.dajungDialog(context, '변경사항이 저장되지 않았습니다.\n다른 요일로 이동하시겠습니까?', '네', (){onPressedDayOfWeek(value);Get.back();}, true);
            }
          }
      );}).toList()
    ));
  }
}
