import 'package:bakery_app/utils/themeData.dart';
import 'package:bakery_app/view/sub/additional/request_additional_item.dart';
import 'package:bakery_app/view/sub/widgets/item_list_card.dart';
import 'package:bakery_app/widgets/custom_widget.dart';
import 'package:bakery_app/widgets/default_layout.dart';
import 'package:flutter/material.dart';

class AdditionalRequest extends StatefulWidget {
  const AdditionalRequest({super.key});

  @override
  State<AdditionalRequest> createState() => _AdditionalRequestState();
}

class _AdditionalRequestState extends State<AdditionalRequest> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(title: '제품 요청', child: Column(children: [
      ItemListCard(dateTime: '', itemList: [],)
    ],),
      bottomSheet: CW.textButton('제품 요청하기', onPressed: () => showDialog(context: context, builder: (ctx) => RequestAdditionalItem()), color: CC.mainColorOpacity),
    );
  }
}
