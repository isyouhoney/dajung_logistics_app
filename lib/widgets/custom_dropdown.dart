import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomDropdown extends StatelessWidget {
  const CustomDropdown({super.key, this.height, this.width}); //required this.list});
  // final List list;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    const List<String> list = <String>['선택', '1', '2', '3','4','5'];
    String dropdownValue = list.first;

    return Padding(
      padding: const EdgeInsets.fromLTRB(5,0,5,5),
      child: Container(
        height: height??50,
        width: width??100.w,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey.shade400,
            ),
          ),
        child: DropdownButton(
          underline: const SizedBox.shrink(),
          isExpanded: true,
          value: dropdownValue,
          icon: const Icon(Icons.arrow_drop_down_rounded,size: 20),
          elevation: 16,
          borderRadius: BorderRadius.circular(10),
          onChanged: (String? value) {
              dropdownValue = value!;
          },
          items: list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value, style: Theme.of(context).textTheme.titleSmall,),
            );
          }).toList(),
        ),
      ),
    );
  }
}
