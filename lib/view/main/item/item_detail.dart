import 'package:bakery_app/widgets/custom_textfield.dart';
import 'package:bakery_app/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ItemDetail extends StatelessWidget {
  const ItemDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      titlePadding: const EdgeInsets.only(top: 20),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16))),
      actionsPadding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
      title: const Center(child: Text('상세 정보', style: TextStyle(fontSize: 18),)),
      content: SingleChildScrollView(
        child: Column(children: [
          Text('상품명'),
          Text('카테고리'),
          Text('가격'),
          CustomTextField(hintText: '상세 설명', maxLine: 5,counterText: true,),
        ],),
      ),
      actions: [
        CW.textButton('확인', onPressed: ()=>Navigator.of(context).pop(), width: 35.w, height: 40)
      ],
    );
  }
}
