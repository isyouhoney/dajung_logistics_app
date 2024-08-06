import 'package:bakery_app/view/main/stock/stock_field.dart';
import 'package:bakery_app/view/sub/history/widget/date_selector.dart';
import 'package:bakery_app/viewmodels/order_service.dart';
import 'package:bakery_app/widgets/custom_container.dart';
import 'package:bakery_app/widgets/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({super.key});

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  RxList orderList = [].obs;

  @override
  void initState() {
    super.initState();
    getOrderHistory();
  }

  void getOrderHistory() async {
    orderList.value = (await OrderService.to.fetchDayOrderHistory(OrderService.to.selectDay.value, OrderService.to.selectDay.value))!;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '주문 내역',
      child: Column(children: [
        const DateSelector(),
        CustomContainer(child: Obx(() => orderList.isNotEmpty? SingleChildScrollView(child: Column(children:
          orderList.value.map((item) => StockField(name: item['itemName'], quantity:item['orderAmount'])).toList()
          ),
        ):const Text('주문 내역이 없습니다.')))
      ],),
    );
  }
}
