import 'package:bakery_app/utils/themeData.dart';
import 'package:bakery_app/viewmodels/order_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class SalesCalendar extends StatefulWidget {
  const SalesCalendar({super.key, required this.selectDay, required this.focusDay});
  final Rx<DateTime> selectDay;
  final Rx<DateTime> focusDay;

  @override
  State<SalesCalendar> createState() => _SalesCalendarState();
}

class _SalesCalendarState extends State<SalesCalendar> {

  RxMap dayTotals = {}.obs;
  RxMap dayOrderItems = {}.obs;

  List getOrderData(DateTime day) {
    WidgetsBinding.instance!.addPostFrameCallback((_){
    if(OrderService.to.orderReports.isNotEmpty){
        num dayTotal = 0;
        dayOrderItems.clear();
        dayTotals.clear();

      OrderService.to.orderReports.forEach((orderSheet){
        dayTotal = 0;
        orderSheet['data'].forEach((item){
          dayTotal += item['salePrice'];
        });
        // order['data'].forEach((item){
        //   dayTotal += item['saleAmount'];
        // });
        dayOrderItems[DateTime.parse(orderSheet['date'])] = orderSheet['data'];
        dayTotals[DateTime.parse(orderSheet['date'])] = dayTotal;
        print(dayOrderItems);
        print(dayTotals);

      });
    }});
    return dayTotals[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Obx(()=>Column(
            children: [
              TableCalendar(
                locale: 'ko_KR',
                firstDay: DateTime(2024, 07, 01),
                lastDay: DateTime(2050, 1, 1),
                focusedDay: widget.selectDay.value,
                headerStyle: HeaderStyle(formatButtonVisible: false, titleCentered: true,
                    leftChevronIcon: Icon(Icons.chevron_left, color: CC.mainColor,),
                    rightChevronIcon: Icon(Icons.chevron_right, color: CC.mainColor,),
                ),
                calendarStyle: CalendarStyle(weekendTextStyle : TextStyle(color: CC.errorColor),
                  selectedDecoration : BoxDecoration(
                    color: CC.mainColor,
                    shape: BoxShape.circle,
                  ),
                  todayDecoration : BoxDecoration(
                    color: CC.subColor,
                    shape: BoxShape.circle,
                  ),),
                selectedDayPredicate: (day) {
                  return isSameDay(widget.selectDay.value, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  widget.selectDay.value = selectedDay;
                  // widget.focusDay.value = focusedDay;
                },
                onPageChanged: (focusedDay) {
                  widget.selectDay.value = focusedDay;
                  OrderService.to.getOrderHistory(widget.selectDay.value);
                  // print('focusDay: ${widget.focusDay}');
                },
                eventLoader: getOrderData,
                calendarBuilders: CalendarBuilders(
                markerBuilder: (context, day, order) {
                    if(order.isNotEmpty) {
                      return Text('${order[0].toString()}원');
                    }
                    return null;
                })
                  ),
              const SizedBox(height: 10,),
              Text('${DateFormat('MM월 dd일 ').format(widget.selectDay.value)} 판매내역', style: Theme.of(context).textTheme.titleMedium,),
            ],
          ),
          ),
          Obx(()=> dayOrderItems[widget.selectDay.value] != null ? Column(children: [
            const Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Text('상품명'),
            Text('주문'),
            Text('회수'),
            Text('판매'),
            Text('판매금액'),
            ],),
            dayOrderItems[widget.selectDay.value].map((dayOrder){
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Text(dayOrder['itemName']),
              Text('${dayOrder['orderAmount'].toString()}개'),
              Text('${dayOrder['recallAmount'].toString()}개'),
              Text('${(dayOrder['orderAmount']-dayOrder['recallAmount']).toString()}개'),
              Text(dayOrder['saleAmount']),
            ],);
          })]):const Center(child: Padding(
            padding: EdgeInsets.only(top: 80),
            child: Text('판매 내역이 없습니다.'),
          )))
        ],
      ),
    );
  }
}
