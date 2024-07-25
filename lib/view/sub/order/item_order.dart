import 'package:bakery_app/view/sub/order/widgets/day_of_week_selector.dart';
import 'package:bakery_app/view/sub/order/widgets/order_form.dart';
import 'package:bakery_app/widgets/custom_widget.dart';
import 'package:bakery_app/widgets/default_layout.dart';
import 'package:flutter/material.dart';

class ItemOrder extends StatefulWidget {
  const ItemOrder({super.key});

  @override
  State<ItemOrder> createState() => _ItemOrderState();
}

class _ItemOrderState extends State<ItemOrder> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        title: '상품 주문서',
        child: Column(
          children: [DayOfWeekSelector(),OrderForm()],
        ),
      bottomSheet: CW.textButton('저장하기'),
    );
  }
}
