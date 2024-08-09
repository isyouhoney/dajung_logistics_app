import 'package:bakery_app/utils/themeData.dart';
import 'package:bakery_app/widgets/custom_dropdown.dart';
import 'package:bakery_app/widgets/quantity_field.dart';
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
        QuantityField(content: '${widget.quantity} EA')
      ],),
    );
  }
}
