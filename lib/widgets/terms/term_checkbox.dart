import 'package:bakery_app/models/term.dart';
import 'package:bakery_app/utils/themeData.dart';
import 'package:bakery_app/widgets/terms/term_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TermCheckBox extends StatefulWidget {
  const TermCheckBox({super.key, this.term, required this.isCheck, this.onTap});
  final Term? term;
  final Function()? onTap;
  final RxBool isCheck;

  @override
  State<TermCheckBox> createState() => _TermCheckBoxState();
}

class _TermCheckBoxState extends State<TermCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Obx(()=>CheckboxListTile(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      activeColor: CC.mainColor,
      title: TermItemWidget(
        title: widget.term?.title ?? '약관 전체 동의',
        onIconTap: widget.term?.content != null ? () async {
          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16))),
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return Container(
                  height: 50.h,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(16.0),
                  child: Text(widget.term!.content)
              );
            },
          );
        }:null,
      ),
      value: widget.isCheck.value,
      onChanged: (value) {
        widget.isCheck.value = value!;
        if (widget.onTap != null) widget.onTap!();
      },
      controlAffinity: ListTileControlAffinity.leading,
    ));
  }
}
