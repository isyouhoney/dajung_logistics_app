import 'package:bakery_app/utils/themeData.dart';
import 'package:bakery_app/view/main/item/item_detail.dart';
import 'package:bakery_app/widgets/custom_dropdown.dart';
import 'package:bakery_app/widgets/custom_widget.dart';
import 'package:flutter/material.dart';

class StockField extends StatelessWidget {
  const StockField({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      child: Row(children: [
        Text(name, style: Theme.of(context).textTheme.titleSmall),
        const Spacer(),
        CustomDropdown(width: 100, height: 40,)
      ],),
    );
  }
}
