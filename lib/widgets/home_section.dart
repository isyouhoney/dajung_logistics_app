import 'package:bakery_app/utils/themeData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeSection extends StatefulWidget {
  const HomeSection(
      {super.key, required this.title, required this.child, this.seeMore});

  final String title;
  final Widget child;
  final Function()? seeMore;

  @override
  State<HomeSection> createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.title, style: Theme.of(context).textTheme.titleMedium),
              !widget.seeMore.isNull ?
              TextButton(onPressed: widget.seeMore, child: Text('더 보기', style: TextStyle(color: CC.mainColor),)) : const SizedBox()
            ],
          ),
        ),
        widget.child
      ],
    );
  }
}
