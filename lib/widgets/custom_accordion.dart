import 'package:bakery_app/view/main/stock/stock_field.dart';
import 'package:bakery_app/viewmodels/order_service.dart';
import 'package:bakery_app/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ExpansionPanelListExample extends StatefulWidget {
  const ExpansionPanelListExample({super.key});

  @override
  State<ExpansionPanelListExample> createState() =>
      _ExpansionPanelListExampleState();
}

class _ExpansionPanelListExampleState extends State<ExpansionPanelListExample> {
  final List data = [];
  RxBool isExpanded = false.obs;

  @override
  void initState() {
    super.initState();
    OrderService.to.fetchDayTotalOrders();
  }

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      insidePadding: 8,
          child: ExpansionPanelList.radio(
              expandedHeaderPadding:EdgeInsets.zero,
            elevation: 0,
                expansionCallback: (int index, onTap) {
          isExpanded.value = onTap;
                },
                children:[
          ExpansionPanelRadio(
            canTapOnHeader: true,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return Align(alignment: Alignment.centerLeft,child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text('오늘 들어온 주문량', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey)),
              ));
            },
            body: SizedBox(height: 30.h,
              child: SingleChildScrollView(
                child: Column(children:
                [
                  StockField(name: '소금빵'),
                  StockField(name: '소금빵'),
                  StockField(name: '소금빵'),
                  StockField(name: '소금빵'),
                  StockField(name: '소금빵'),
                  StockField(name: '소금빵'),
                  StockField(name: '소금빵'),
                  StockField(name: '소금빵'),
                ]
                // data.map((e)=>StockField(name: e.itemName)).toList()
                ),
              ),
            ), value: isExpanded.value
                )
                ]
                ),
        );
}}
