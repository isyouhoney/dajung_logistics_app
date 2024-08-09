import 'package:bakery_app/utils/themeData.dart';
import 'package:flutter/material.dart';

class QuantityField extends StatelessWidget {
  const QuantityField({super.key, required this.content, this.color, this.width, this.radius, this.padding, this.fontSize});
  final String content;
  final Color? color;
  final double? width;
  final double? radius;
  final double? padding;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding ?? 2),
      child: Container(width: width ?? 60, height:35, padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: color ?? CC.mainColorOpacity,
            borderRadius: BorderRadius.circular(radius ?? 12)),child: Center(child: Text(content, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white, fontSize: fontSize ?? 16))),),
    );
  }
}
