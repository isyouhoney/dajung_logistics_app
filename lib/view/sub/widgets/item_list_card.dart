import 'package:bakery_app/models/additional_request.dart';
import 'package:bakery_app/utils/enums.dart';
import 'package:bakery_app/utils/themeData.dart';
import 'package:bakery_app/viewmodels/auth_service.dart';
import 'package:bakery_app/viewmodels/request_service.dart';
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
  RxBool isActivated = true.obs;

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
      Obx(() => CW.textButton(height: 40, radius: 10,
          color: !isActivated.value ? Colors.grey :
          widget.request.request?.id != AuthService.to.user?.id ? CC.errorColor : CC.mainColor,
          widget.request.status == '요청중' ? widget.request.request?.id == AuthService.to.user?.id ? '요청취소' : '수락하기': widget.request.status,
          onPressed: (){
            isActivated.value ? widget.request.request?.id != AuthService.to.user?.id ?
            RequestService.to.acceptRequest(widget.request.id!).then((value) => isActivated.value = true) :
            RequestService.to.cancelRequest(widget.request.id!).then((value) => isActivated.value = true) : null;
            RequestService.to.fetchRequests(RequestedBy.byMe);
            RequestService.to.fetchRequests(RequestedBy.byOthers);
      })),
    ],),);
  }
}
