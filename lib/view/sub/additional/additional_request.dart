import 'package:bakery_app/utils/enums.dart';
import 'package:bakery_app/utils/themeData.dart';
import 'package:bakery_app/view/sub/additional/request_additional_item.dart';
import 'package:bakery_app/view/sub/widgets/item_list_card.dart';
import 'package:bakery_app/viewmodels/request_service.dart';
import 'package:bakery_app/widgets/banner_field.dart';
import 'package:bakery_app/widgets/custom_widget.dart';
import 'package:bakery_app/widgets/default_layout.dart';
import 'package:bakery_app/widgets/fold_pannel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AdditionalRequest extends StatefulWidget {
  const AdditionalRequest({super.key});

  @override
  State<AdditionalRequest> createState() => _AdditionalRequestState();
}

class _AdditionalRequestState extends State<AdditionalRequest> {

  @override
  void initState() {
    super.initState();
    RequestService.to.fetchRequests(RequestedBy.byMe);
    RequestService.to.fetchRequests(RequestedBy.byOthers);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(title: '제품 요청',
      bottomSheet: CW.textButton('제품 요청하기', onPressed: () => showDialog(context: context, builder: (ctx) => const RequestAdditionalItem()), color: CC.mainColorOpacity),
      child: Obx(()=>SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FoldPanel(initExpand: true, titleWidget: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('진행중인 요청', style: Theme.of(context).textTheme.titleMedium),
                Text('${RequestService.to.requestList.length}건', style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
                bodyWidget: RequestService.to.requestList.isEmpty?
                  Center(child: Padding(padding: EdgeInsets.symmetric(vertical: 7.5.h),
                      child: const Text('현재 진행중인 요청이 없습니다.'))):
                  Obx(() => BannerField(list:RequestService.to.requestList.value.map((value) =>
                      ItemListCard(request: value, onPressed: (isActivated) {
                        isActivated ? RequestService.to.acceptRequest(value.id!).then((success) {
                          if(success){
                            CW.dajungDialog(context,'${value.orderItem.item.itemName}/${value.orderItem.quantity}개 요청을 수락하였습니다.','확인', () => Get.back(), false);
                            isActivated = false;
                          }
                    }) : null;
                  }, color: CC.errorColor, text: '수락하기')).toList())),
                height: 24.h),
            Padding(padding: const EdgeInsets.fromLTRB(15,5,0,5),
              child: Row(children: [
                  const Icon(Icons.add_shopping_cart),
                  const SizedBox(width: 5,),
                  Text('나의 요청', style: Theme.of(context).textTheme.titleMedium),],),),
            RequestService.to.myRequestHistory.isEmpty? const Center(child: Padding(padding: EdgeInsets.all(30),
              child: Text('나의 요청 기록이 없습니다.'),)):
            Obx(() => Column(children: RequestService.to.myRequestHistory.value.map((value) =>
                ItemListCard(request: value, onPressed: (isActivated) {
                  isActivated ? RequestService.to.cancelRequest(value.id!).then((success) {
                    if(success){
                      CW.dajungDialog(context,'요청을 취소하였습니다.','확인', () => Get.back(), false);
                      isActivated = false;
                    }
              }) : null;
            }, color: CC.mainColor, text: value.status == '요청중' ? '요청취소' : value.status)).toList())),
          ],
        ),
      ),
    ),
    );
  }
}
