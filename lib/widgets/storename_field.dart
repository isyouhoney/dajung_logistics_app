import 'package:flutter/material.dart';

class StorenameField extends StatelessWidget {
  const StorenameField({super.key, required this.name, this.child, this.preIcon, this.iconColor});
  final String name;
  final Widget? child;
  final IconData? preIcon;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(preIcon ?? Icons.store, color: iconColor ?? Colors.grey),
        const SizedBox(width: 5),
        Text(name, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey)),
        const Spacer(),
        child ?? const SizedBox()
      ],
    );
  }
}
