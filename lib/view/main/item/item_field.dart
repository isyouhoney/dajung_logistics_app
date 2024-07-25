import 'package:bakery_app/utils/themeData.dart';
import 'package:bakery_app/view/main/item/item_detail.dart';
import 'package:bakery_app/widgets/custom_widget.dart';
import 'package:flutter/material.dart';

class ItemField extends StatelessWidget {
  const ItemField({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Row(children: [
        Text(name, style: Theme.of(context).textTheme.titleSmall),
        const Spacer(),
        CW.textButton('상세', width: 60, height: 30, color: CC.mainColor, radius: 8,
            onPressed: () => showDialog(context: context, builder: (ctx) => ItemDetail())),
        const SizedBox(width: 10),
        CW.textButton('삭제', width: 60, height: 30, color: Colors.grey, radius: 8,
            onPressed: (){}),
      ],),
    );
  }
}
