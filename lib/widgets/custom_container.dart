import 'package:bakery_app/widgets/custom_widget.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.child, this.width, this.height});
  final Widget child;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(14),
    boxShadow: [
    BoxShadow(
    color: Colors.grey.withOpacity(0.4),
    spreadRadius: 0.9,
    blurRadius: 10,
    offset: const Offset(1, 1)
    ),
    ],
    ),child: child,
    ));
  }
}
