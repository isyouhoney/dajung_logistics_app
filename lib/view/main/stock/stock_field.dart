import 'package:bakery_app/widgets/custom_dropdown.dart';
import 'package:bakery_app/widgets/quantity_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class StockField extends StatefulWidget {
  const StockField({super.key, required this.name, this.isCounted, this.quantity, this.initValue});
  final String name;
  final ValueChanged<String>? isCounted;
  final int? quantity;
  final int? initValue;


  @override
  State<StockField> createState() => _StockFieldState();
}

class _StockFieldState extends State<StockField> {
  RxList<String> numbers = List.generate(100, (index) => index.toString()).obs;

  @override
  Widget build(BuildContext context) {
    RxString number = widget.initValue != null ? widget.initValue.toString().obs : numbers[0].obs;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(children: [
        Text(widget.name, style: Theme.of(context).textTheme.titleMedium),
        const Spacer(),
        widget.isCounted!=null?
        CustomDropdown(width: 80, height: 40, selectedValue: number, list: numbers.value, onChange: (value) => widget.isCounted!(value),):
        QuantityField(content: '${widget.quantity} EA')
      ],),
    );
  }
}
