import 'package:bakery_app/utils/themeData.dart';
import 'package:bakery_app/viewmodels/report_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:table_calendar/table_calendar.dart';

class SalesCalendar extends StatefulWidget {
  const SalesCalendar({super.key, required this.selectDay, required this.focusDay});
  final Rx<DateTime> selectDay;
  final Rx<DateTime> focusDay;

  @override
  State<SalesCalendar> createState() => _SalesCalendarState();
}

class _SalesCalendarState extends State<SalesCalendar> {

  List getOrderData(DateTime day) {
    DateTime localDay = DateTime(day.year, day.month, day.day);
    for (DateTime date in ReportService.to.dayTotals.keys) {
      if (date.year == localDay.year && date.month == localDay.month && date.day == localDay.day) {
        return ReportService.to.dayTotals[date] ?? [];
      }
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Obx(() => ReportService.to.dayTotals.isNotEmpty ? Column(
            children: [
              TableCalendar(
                locale: 'ko_KR',
                firstDay: DateTime(2024, 07, 01),
                lastDay: DateTime(2050, 1, 1),
                focusedDay: widget.selectDay.value,
                headerStyle: HeaderStyle(formatButtonVisible: false, titleCentered: true,
                    headerPadding: EdgeInsets.zero,
                    titleTextStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                    leftChevronIcon: Icon(Icons.chevron_left, color: CC.mainColor,),
                    rightChevronIcon: Icon(Icons.chevron_right, color: CC.mainColor,),
                ),
                calendarStyle: CalendarStyle(
                  weekendTextStyle : TextStyle(color: CC.errorColor),
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
                  ReportService.to.getOrderHistory(widget.selectDay.value);
                },
                eventLoader: getOrderData,
                calendarBuilders: CalendarBuilders(markerBuilder: (context, day, order) {
                    if(order.isNotEmpty) {
                      return order[0] != 0 ? Text(NumberFormat('###,###,###,###').format(order[0]).toString(), style: TextStyle(fontSize: 10, color: CC.mainColorShaded, fontWeight: FontWeight.w700)) : const SizedBox();
                    }
                    return null;
                })
                  ),
              const SizedBox(height: 10,),
              Text('${DateFormat('MM월 dd일 ').format(widget.selectDay.value)} 판매내역', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 10,),
            ],
          ) : const CircularProgressIndicator(),
          ),
          Obx(() {
            DateTime selectedDate = DateTime(widget.selectDay.value.year, widget.selectDay.value.month, widget.selectDay.value.day);
            var dayOrderItemsForSelectedDate = ReportService.to.dayOrderItems[selectedDate];

            if (dayOrderItemsForSelectedDate != null && dayOrderItemsForSelectedDate.isNotEmpty) {
              return Column(
                children: [
                  tableFormat('상품명', '주문', '회수', '판매', '판매금액', isTitle: true),
                  ...dayOrderItemsForSelectedDate.map<Widget>((dayOrder) {
                    String formattedPrice = NumberFormat('###,###,###,###').format(dayOrder['salePrice']).toString();
                    return tableFormat(
                        dayOrder['itemName'], '${dayOrder['orderAmount']}개',
                        '${dayOrder['recallAmount']}개',
                        '${dayOrder['orderAmount'] - dayOrder['recallAmount']}개', '$formattedPrice 원');
                  }).toList(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(alignment: Alignment.centerRight,child: Text('Total ${NumberFormat('###,###,###,###').format(ReportService.to.dayTotals[selectedDate]?[0])}원', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: CC.mainColorShaded))),
                  )
                ],
              );
            } else {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 80),
                  child: Text('판매 내역이 없습니다.'),
                ),
              );
            }
          })

        ],
    );
  }

  Widget tableFormat(String name, String orderNum, String recallNum, String saleNum, String price, {bool isTitle = false}){
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 35.w, child: Align(alignment: isTitle? Alignment.center : Alignment.centerLeft, child: Text(name, style: isTitle ? Theme.of(context).textTheme.titleMedium?.copyWith(color:CC.mainColorShaded) : Theme.of(context).textTheme.titleMedium))),
          SizedBox(width: 12.w, child: Text(orderNum, style: isTitle ? Theme.of(context).textTheme.titleMedium?.copyWith(color:CC.mainColorShaded) : Theme.of(context).textTheme.bodyLarge)),
          SizedBox(width: 12.w, child: Text(recallNum, style: isTitle ? Theme.of(context).textTheme.titleMedium?.copyWith(color:CC.mainColorShaded) : Theme.of(context).textTheme.bodyLarge)),
          SizedBox(width: 12.w, child: Text(saleNum, style: isTitle ? Theme.of(context).textTheme.titleMedium?.copyWith(color:CC.mainColorShaded) : Theme.of(context).textTheme.bodyLarge)),
          SizedBox(width: 20.w, child: Align(alignment: isTitle? Alignment.center : Alignment.centerRight, child : Text(price, style: isTitle ? Theme.of(context).textTheme.titleMedium?.copyWith(color:CC.mainColorShaded) : Theme.of(context).textTheme.bodyLarge))),
        ],
      ),
    );
  }
}
