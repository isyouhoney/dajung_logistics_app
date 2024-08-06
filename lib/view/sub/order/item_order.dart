import 'package:bakery_app/utils/enums.dart';
import 'package:bakery_app/view/sub/order/widgets/day_of_week_selector.dart';
import 'package:bakery_app/view/sub/order/widgets/order_form.dart';
import 'package:bakery_app/viewmodels/order_service.dart';
import 'package:bakery_app/widgets/custom_widget.dart';
import 'package:bakery_app/widgets/default_layout.dart';
import 'package:flutter/material.dart';

class ItemOrder extends StatefulWidget {
  const ItemOrder({super.key});

  @override
  State<ItemOrder> createState() => _ItemOrderState();
}

class _ItemOrderState extends State<ItemOrder> {
  DayOfWeek dayOfWeek = DayOfWeek.mon;

  @override
  void initState() {
    super.initState();
    getOrders();
  }

  void getOrders() async {
    OrderService.to.dailyOrderList.value = [];
    await OrderService.to.fetchOrderSheets();
    await OrderService.to.fetchTodayOrderSheets(dayOfWeek);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        title: '상품 주문서',
        bottomSheet: CW.textButton('저장하기', onPressed: (){
          OrderService.to.postOrders(dayOfWeek, OrderService.to.dailyOrderList.value);
        }),
        child: Column(children: [
            DayOfWeekSelector(dayOfWeek: (value) => dayOfWeek = value,
                onChange: (value) => OrderService.to.fetchTodayOrderSheets(dayOfWeek)),
            const OrderForm()
        ],
        ),
    );
  }
}
