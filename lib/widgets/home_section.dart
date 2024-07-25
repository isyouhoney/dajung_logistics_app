import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeSection extends StatefulWidget {
  const HomeSection({super.key, required this.title, required this.child, this.seeMore});
  final String title;
  final Widget child;
  final Function()? seeMore;


  @override
  State<HomeSection> createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(widget.title, style: Theme.of(context).textTheme.titleMedium,),
          ),
              !widget.seeMore.isNull ? TextButton(onPressed: widget.seeMore, child: const Text('더 보기')):const SizedBox()
            ],
        ),
        widget.child
      ],),
    );
  }
}
