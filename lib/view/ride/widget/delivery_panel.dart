import 'package:bakery_app/models/order.dart';
import 'package:bakery_app/utils/themeData.dart';
import 'package:bakery_app/view/main/stock/stock_field.dart';
import 'package:bakery_app/view/ride/delivery_report.dart';
import 'package:bakery_app/widgets/copy_Icon.dart';
import 'package:bakery_app/widgets/custom_container.dart';
import 'package:bakery_app/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DeliveryPanel extends StatefulWidget {
  const DeliveryPanel({super.key, required this.order});
  final Order order;

  @override
  State<DeliveryPanel> createState() =>
      _DeliveryPanelState();
}

class _DeliveryPanelState extends State<DeliveryPanel> {
  RxBool isExpanded = false.obs;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      paddingLTRB: const EdgeInsets.symmetric(vertical: 8),
      child: ExpansionPanelList.radio(
          expandedHeaderPadding:EdgeInsets.zero,
          elevation: 0,
          expansionCallback: (int index, onTap) => isExpanded.value = onTap,
          children:[
            ExpansionPanelRadio(
              backgroundColor: Colors.transparent,
                canTapOnHeader: true,
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return Align(alignment: Alignment.centerLeft,child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        const Icon(Icons.store),
                        Text(widget.order.orderSheet!.orderer!.storeName!, style: Theme.of(context).textTheme.titleMedium),
                        CopyIcon(copyText: widget.order.orderSheet!.orderer!.address!),
                      ],
                    ),
                  ));
                },
                body: SizedBox(height: 25.h,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        widget.order.orderSheet.orderItems.isNotEmpty ? Column(children: widget.order.orderSheet.orderItems.map((e) =>
                            StockField(name: e.item.itemName, quantity: e.quantity)).toList())
                            : Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.h),
                              child: Text('오늘의 주문이 없습니다.', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey),),
                            ),
                        const SizedBox(height: 5,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: CW.textButton(widget.order.orderSheet.orderItems.isNotEmpty ? '배송 보고' : '회수 보고', onPressed: () => Get.to(() => DeliveryReport(order: widget.order)), height: 45, color: CC.mainColorShaded),
                        ),
                      ],
                    )
                  ),
                ), value: isExpanded.value
            )
          ]
      ),
    );
  }}
