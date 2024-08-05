import 'package:bakery_app/utils/enums.dart';
import 'package:bakery_app/utils/themeData.dart';
import 'package:bakery_app/view/sub/additional/request_additional_item.dart';
import 'package:bakery_app/view/sub/widgets/item_list_card.dart';
import 'package:bakery_app/viewmodels/request_service.dart';
import 'package:bakery_app/widgets/custom_widget.dart';
import 'package:bakery_app/widgets/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
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
    return DefaultLayout(title: '제품 요청',isPadded: false,
      bottomSheet: CW.textButton('제품 요청하기', onPressed: () => showDialog(context: context, builder: (ctx) => RequestAdditionalItem()), color: CC.mainColorOpacity), child:
    Obx(()=>SingleChildScrollView(
      child: Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('진행중인 요청', style: Theme.of(context).textTheme.titleMedium),
            RequestService.to.requestList.isEmpty? const Center(child: Padding(
              padding: EdgeInsets.all(30),
              child: Text('현재 진행중인 요청이 없습니다.'),
            )):
            Column(children: RequestService.to.requestList.map((value) => ItemListCard(dateTime: value.requestDate, itemList: value.item)).toList()),
            const SizedBox(height: 10,),
            Text('나의 요청', style: Theme.of(context).textTheme.titleMedium),
            RequestService.to.myRequestHistory.isEmpty? const Center(child: Padding(
              padding: EdgeInsets.all(30),
              child: Text('나의 요청 기록이 없습니다.'),
            )):
            Column(children: RequestService.to.myRequestHistory.map((value) => ItemListCard(dateTime: value.requestDate, itemList: value.item)).toList()),
          ],
        ),
      ),
    )),
    );
  }
}
