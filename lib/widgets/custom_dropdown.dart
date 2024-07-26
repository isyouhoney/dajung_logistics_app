import 'package:bakery_app/viewmodels/item_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomDropdown extends StatefulWidget {
  CustomDropdown(
      {super.key, this.height, this.width, this.list, this.selectedValue,
      });

  final List<String>? list;
  final double? height;
  final double? width;
  final RxString? selectedValue;

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    const List<String> noList = ['선택'];

      return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        height: widget.height ?? 50,
        width: widget.width ?? 100.w,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey.shade400,
          ),
        ),
        child: Obx(()=>DropdownButton(
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: widget.selectedValue?.value == widget.list?.first ? Colors.grey : Colors.black),
            underline: const SizedBox.shrink(),
            isExpanded: true,
            value: widget.selectedValue?.value,
            icon: const Icon(Icons.keyboard_arrow_down),
            elevation: 16,
            borderRadius: BorderRadius.circular(10),
            onChanged: (String? value) {
              widget.selectedValue?.value = value!;
              print('widget.selectedValue?.value : ${widget.selectedValue?.value}');
            },
            items: widget.list != null
                ? widget.list!.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: Theme.of(context).textTheme.bodyLarge),
                    );
                  }).toList()
                : noList.map((value) {
                    return DropdownMenuItem<String>(
                      value: widget.selectedValue?.value,
                      child: Text(value, style: Theme.of(context).textTheme.bodyLarge),
                    );
                  }).toList())),
      ));
  }
}
