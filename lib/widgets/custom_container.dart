import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.child, this.width, this.height, this.insidePadding, this.color, this.paddingLTRB});
  final Widget child;
  final double? width;
  final double? height;
  final double? insidePadding;
  final EdgeInsets? paddingLTRB;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        width: width,
        height: height,
        padding: paddingLTRB??EdgeInsets.all(insidePadding??10),
        decoration: BoxDecoration(
    color: color ?? Colors.white,
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
