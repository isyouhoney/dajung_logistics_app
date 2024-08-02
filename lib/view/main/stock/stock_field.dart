import 'package:bakery_app/utils/themeData.dart';
import 'package:bakery_app/view/main/item/item_detail.dart';
import 'package:bakery_app/widgets/custom_dropdown.dart';
import 'package:bakery_app/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class StockField extends StatefulWidget {
  const StockField({super.key, required this.name, this.count, this.quantity});
  final String name;
  final ValueChanged<String>? count;
  final int? quantity;


  @override
  State<StockField> createState() => _StockFieldState();
}

class _StockFieldState extends State<StockField> {
  RxList<String> numbers = List.generate(100, (index) => index.toString()).obs;

  @override
  Widget build(BuildContext context) {
  RxString number = numbers[0].obs;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(children: [
        Text(widget.name, style: Theme.of(context).textTheme.titleMedium),
        const Spacer(),
        widget.count!=null?
        CustomDropdown(width: 80, height: 40, selectedValue: number, list: numbers.value, onChange: (value)=>widget.count!(value),):
            Padding(
              padding: const EdgeInsets.all(2),
              child: Container(width:60, height:35, padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: CC.mainColorOpacity,
                  borderRadius: BorderRadius.circular(12)),child: Center(child: Text('${widget.quantity} EA', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),)),),
            )
      ],),
    );
  }
}
