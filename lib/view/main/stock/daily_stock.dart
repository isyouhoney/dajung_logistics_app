import 'package:bakery_app/view/main/stock/stock_field.dart';
import 'package:bakery_app/widgets/custom_container.dart';
import 'package:bakery_app/widgets/custom_widget.dart';
import 'package:bakery_app/widgets/default_layout.dart';
import 'package:flutter/material.dart';

class DailyStock extends StatefulWidget {
  const DailyStock({super.key});

  @override
  State<DailyStock> createState() => _DailyStockState();
}

class _DailyStockState extends State<DailyStock> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(title: '당일 재고 입력', bottomSheet: CW.textButton('저장'),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Text('2024.07.30', style: Theme.of(context).textTheme.titleMedium),
      ),
      const CustomContainer(child: Column(children: [
        StockField(name: '소금빵'),
        StockField(name: '초코 소금빵'),
        StockField(name: '대파 소금빵'),
        StockField(name: '소금빵'),
        StockField(name: '상품명'),
        StockField(name: '상품명'),
      ],))
    ],),);
  }
}
