import 'package:bakery_app/models/additional_request.dart';
import 'package:bakery_app/utils/themeData.dart';
import 'package:bakery_app/widgets/custom_container.dart';
import 'package:bakery_app/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ItemListCard extends StatefulWidget {
  const ItemListCard({super.key, required this.request});
  final AdditionalRequest request;

  @override
  State<ItemListCard> createState() => _ItemListCardState();
}

class _ItemListCardState extends State<ItemListCard> {
  // late RxString status;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   status.value = widget.request.status;
  // }
  @override
  Widget build(BuildContext context) {
    return CustomContainer(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(4,4,0,0),
        child: Text(widget.request.requestDate, style: Theme.of(context).textTheme.headlineMedium,),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Container(padding: const EdgeInsets.all(12), width: 100.w,
          decoration: BoxDecoration(
            color: CC.backgroundColor,
            borderRadius: BorderRadius.circular(10)),child: Column(crossAxisAlignment: CrossAxisAlignment.start,children:[
              Text('요청 내역', style: Theme.of(context).textTheme.labelMedium?.copyWith(color: CC.mainColorShaded)),
              const SizedBox(height: 3,),
              Text('${widget.request.orderItem.item.itemName} - ${widget.request.orderItem.quantity} EA', style: Theme.of(context).textTheme.labelMedium?.copyWith(height: 1.5)),
            ])),
      ),
      // Obx(()=>CW.textButton(status.value, height: 40, radius: 10, onPressed: (){}))
      CW.textButton(widget.request.status, height: 40, radius: 10, onPressed: (){})
    ],),);
  }
}
