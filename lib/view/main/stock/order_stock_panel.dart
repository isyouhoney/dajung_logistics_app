import 'package:bakery_app/view/main/stock/stock_field.dart';
import 'package:bakery_app/viewmodels/order_service.dart';
import 'package:bakery_app/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OrderStockPanel extends StatefulWidget {
  const OrderStockPanel({super.key});

  @override
  State<OrderStockPanel> createState() =>
      _OrderStockPanelState();
}

class _OrderStockPanelState extends State<OrderStockPanel> {
  List data = [];
  RxBool isExpanded = false.obs;

  @override
  void initState() {
    super.initState();

  }

  void getData() async {
    data = (await OrderService.to.fetchDayTotalOrders())!;
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      insidePadding: 8,
          child: ExpansionPanelList.radio(
              expandedHeaderPadding:EdgeInsets.zero,
            elevation: 0,
                expansionCallback: (int index, onTap) =>isExpanded.value = onTap,
                children:[
          ExpansionPanelRadio(
            canTapOnHeader: true,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return Align(alignment: Alignment.centerLeft,child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text('제품 주문량', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey)),
              ));
            },
            body: SizedBox(height: 30.h,
              child: SingleChildScrollView(
                child: data.isNotEmpty ? Column(children:
                data.map((e)=>StockField(name: e.itemName, quantity: e.quantity)).toList()
                ): Center(child: Padding(
                  padding: EdgeInsets.only(top: 11.h),
                  child: const Text('들어온 주문이 없습니다.'),
                )),
              ),
            ), value: isExpanded.value
                )
                ]
                ),
        );
}}
