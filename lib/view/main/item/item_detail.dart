import 'dart:io';

import 'package:bakery_app/models/item.dart';
import 'package:bakery_app/widgets/custom_textfield.dart';
import 'package:bakery_app/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ItemDetail extends StatelessWidget {
  const ItemDetail({super.key, required this.item});
  final Item item;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      titlePadding: const EdgeInsets.only(top: 20),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16))),
      actionsPadding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
      title: const Center(child: Text('제품 상세', style: TextStyle(fontSize: 18),)),
      content: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Center(child: Image.network(item.image, height: 30.h,)),
          Text(item.itemName, style: TextStyle(height: 2),),
          Text('카테고리', style: TextStyle(height: 2)),
          Text('가격 : ${item.price}', style: TextStyle(height: 2)),
          CustomTextField(hintText: item.description, maxLine: 5, readOnly: true,),
        ],),
      ),
      actions: [
        Center(child: CW.textButton('확인', onPressed: ()=>Navigator.of(context).pop(), width: 100.w, height: 40))
      ],
    );
  }
}
