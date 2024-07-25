import 'package:flutter/material.dart';

class TermItemWidget extends StatelessWidget {
  final String title;
  final VoidCallback? onIconTap;

  const TermItemWidget({
    super.key,
    required this.title,
    this.onIconTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Text(title, style: Theme.of(context).textTheme.titleMedium)),
        onIconTap != null ? GestureDetector(
          onTap: onIconTap,
          child: const Icon(Icons.arrow_forward_ios),
        ):const SizedBox(),
      ],
    );
  }
}
