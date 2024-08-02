import 'package:bakery_app/view/main/item/add_item.dart';
import 'package:flutter/material.dart';

class AddItemButton extends StatelessWidget {
  const AddItemButton({super.key, this.nextPage});
  final Widget? nextPage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDialog(context: context, builder: (ctx) => nextPage ?? const AddItem()),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(children: [
          const Icon(Icons.add_circle_outline, color: Colors.grey,),
          const SizedBox(height: 8),
          Text('상품 추가하기', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey))
        ],),
      ),
    );
  }
}
