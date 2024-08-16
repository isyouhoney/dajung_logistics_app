import 'package:bakery_app/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FoldPanel extends StatefulWidget {
  const FoldPanel({super.key, required this.initExpand, required this.titleWidget, required this.bodyWidget});
  final bool initExpand;
  final Widget titleWidget;
  final Widget bodyWidget;

  @override
  State<FoldPanel> createState() =>
      _FoldPanelState();
}

class _FoldPanelState extends State<FoldPanel> {
  RxBool isExpanded = true.obs;

  @override
  void initState() {
    super.initState();
    isExpanded.value = widget.initExpand;
  }

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      insidePadding: 8,
      child: ExpansionPanelList.radio(
          expandedHeaderPadding:EdgeInsets.zero,
          elevation: 0,
          expansionCallback: (int index, onTap) => isExpanded.value = onTap,
          children:[
            ExpansionPanelRadio(
                canTapOnHeader: true,
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return Align(alignment: Alignment.centerLeft,child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: widget.titleWidget
                  ));
                },
                body: SizedBox(height: 25.h,
                  child: SingleChildScrollView(
                      child: widget.bodyWidget
                  ),
                ), value: isExpanded.value
            )
          ]
      ),
    );
  }}
