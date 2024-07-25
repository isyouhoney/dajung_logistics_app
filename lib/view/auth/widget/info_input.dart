import 'package:bakery_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class InfoInput extends StatefulWidget {
  const InfoInput({super.key});

  @override
  State<InfoInput> createState() => _InfoInputState();
}

class _InfoInputState extends State<InfoInput> {
  late TextEditingController storeController;
  late TextEditingController dutyController;
  late TextEditingController nameController;

  @override
  void initState() {
    super.initState();
    storeController = TextEditingController();
    dutyController = TextEditingController();
    nameController = TextEditingController();
  }

  @override
  void dispose() {
    storeController.dispose();
    dutyController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomTextField(
            hintText: '성함',
            validator: (val) {
              return null;
            },
            controller: storeController),
        CustomTextField(
            hintText: '이메일',
            validator: (val) {
              return null;
            },
            controller: nameController),
        const SizedBox(height: 10),
      ],
    );
  }
}