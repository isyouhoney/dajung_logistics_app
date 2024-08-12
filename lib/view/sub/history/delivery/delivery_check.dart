import 'package:bakery_app/models/order.dart';
import 'package:bakery_app/viewmodels/delivery_service.dart';
import 'package:bakery_app/widgets/custom_container.dart';
import 'package:bakery_app/widgets/default_layout.dart';
import 'package:flutter/material.dart';

class DeliveryCheck extends StatefulWidget {
  const DeliveryCheck({super.key, required this.orderDate, required this.totalOrderAmount, required this.totalRecallAmount});
  final String orderDate;
  final int totalOrderAmount;
  final int totalRecallAmount;

  @override
  State<DeliveryCheck> createState() => _DeliveryCheckState();
}

class _DeliveryCheckState extends State<DeliveryCheck> {
  Order? order;
  @override
  void initState() {
    super.initState();
    getData(widget.orderDate);
  }

  void getData(String orderDate) async {
    DateTime today = DateTime.parse(orderDate);
    DateTime yesterday = DateTime.parse(orderDate).subtract(Duration(days: 1));
    order = (await DeliveryService.to.fetchDeliveryDetail(today, yesterday))!;
  }
  
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(title: '배송 확인', child: CustomContainer(child: Column(children: [
      // Text(order!.orderDate, style: Theme.of(context).textTheme.titleMedium,),
      Text('총 주문 갯수 : ${widget.totalOrderAmount}', style: Theme.of(context).textTheme.bodyLarge),
      Text('총 회수 갯수 : ${widget.totalRecallAmount}', style: Theme.of(context).textTheme.bodyLarge),

    ],),

    ));
  }
}
