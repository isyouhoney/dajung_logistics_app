import 'package:bakery_app/view/main/stock/stock_field.dart';
import 'package:bakery_app/viewmodels/order_service.dart';
import 'package:bakery_app/widgets/fold_pannel.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OrderStockPanel extends StatefulWidget {
  const OrderStockPanel({super.key});

  @override
  State<OrderStockPanel> createState() =>
      _OrderStockPanelState();
}

class _OrderStockPanelState extends State<OrderStockPanel> {
  @override
  Widget build(BuildContext context) {
    return FoldPanel(
            titleWidget: Align(alignment: Alignment.centerLeft,child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text('제품 주문량', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey)),
              )),
            bodyWidget: SizedBox(height: 30.h,
              child: Obx(() => SingleChildScrollView(
                child: OrderService.to.orderList.isNotEmpty ? Column(children:
                OrderService.to.orderList.map((e) => StockField(name: e['itemName'], quantity: e['quantity'])).toList()
                ) : const Center(child: CircularProgressIndicator(),
                ),
              )),
            ), initExpand: true,
        );
}}
