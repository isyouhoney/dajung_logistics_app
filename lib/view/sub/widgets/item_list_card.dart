import 'package:bakery_app/models/item.dart';
import 'package:bakery_app/utils/themeData.dart';
import 'package:bakery_app/widgets/custom_container.dart';
import 'package:bakery_app/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ItemListCard extends StatelessWidget {
  const ItemListCard({super.key, required this.dateTime, required this.itemList});
  final String dateTime;
  final List<Item> itemList;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(4,4,0,0),
        child: Text('2024.08.13(화) 14:00', style: Theme.of(context).textTheme.titleSmall,),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Container(padding: const EdgeInsets.all(12), width: 100.w,
          decoration: BoxDecoration(
            color: CC.subColor,
            borderRadius: BorderRadius.circular(10)),child: Column(crossAxisAlignment: CrossAxisAlignment.start,children:[
              Text('요청 내역', style: Theme.of(context).textTheme.labelMedium?.copyWith(color: CC.mainColorShaded)),
              const SizedBox(height: 3,),
              Text('대파크림치즈 소금빵 5EA', style: Theme.of(context).textTheme.labelMedium?.copyWith(height: 1.5)),
            ])),
      ),
      CW.textButton('재요청',height: 40, radius: 10, onPressed: (){})
    ],),);
  }
}
