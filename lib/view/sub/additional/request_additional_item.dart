import 'package:bakery_app/widgets/custom_dropdown.dart';
import 'package:bakery_app/widgets/custom_textfield.dart';
import 'package:bakery_app/widgets/custom_widget.dart';
import 'package:bakery_app/widgets/image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RequestAdditionalItem extends StatefulWidget {
  const RequestAdditionalItem({super.key});

  @override
  State<RequestAdditionalItem> createState() => _RequestAdditionalItemState();
}

class _RequestAdditionalItemState extends State<RequestAdditionalItem> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
        return AlertDialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 0),
          titlePadding: const EdgeInsets.only(top: 20),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16))),
          actionsPadding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
          title: const Center(child: Text('제품 요청', style: TextStyle(fontSize: 18),)),
          content: Row(children: [
            CustomDropdown(width: 50.w),
            CustomDropdown(width: 30.w),
            ],),
          actions: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
            CW.textButton('취소',onPressed: ()=>Navigator.of(context).pop(), width: 35.w, height: 40, color: Colors.grey),
            CW.textButton('요청', onPressed: (){}, width: 35.w, height: 40)],)
          ],
        );
  }
}
