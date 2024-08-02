import 'package:bakery_app/utils/themeData.dart';
import 'package:bakery_app/view/main/item/item_detail.dart';
import 'package:bakery_app/widgets/custom_widget.dart';
import 'package:flutter/material.dart';

class ItemFieldLayout extends StatelessWidget {
  const ItemFieldLayout({super.key, required this.name, required this.mainWidget, required this.subWidget});
  final String name;
  final Widget mainWidget;
  final Widget subWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(children: [
        Text(name, style: Theme.of(context).textTheme.titleMedium),
        const Spacer(),
        mainWidget,
        const SizedBox(width: 5),
        subWidget,
      ],),
    );
  }
}
