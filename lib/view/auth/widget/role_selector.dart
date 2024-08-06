import 'package:bakery_app/utils/enums.dart';
import 'package:bakery_app/utils/themeData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoleSelector extends StatefulWidget {
  const RoleSelector({super.key, required this.role});

  final ValueChanged<Role> role;

  @override
  State<RoleSelector> createState() => _RoleSelectorState();
}

class _RoleSelectorState extends State<RoleSelector> {
  Rx<Role> selectedRole = Role.MAIN.obs;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (Role value in Role.values.toList().skip(1))
          Padding(
              padding: const EdgeInsets.all(8),
              child: Row(children: [
                Obx(() => Radio(
                      value: value.view,
                      groupValue: selectedRole.value.view,
                      onChanged: (v) async {
                        selectedRole.value = Role.fromView(v.toString())!;
                        widget.role(selectedRole.value);
                      },
                      activeColor: CC.mainColor,
                      visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    )),
                const SizedBox(
                  width: 5,
                ),
                Text(value.view, style: Theme.of(context).textTheme.titleSmall)
              ])),
      ],
    );
  }
}
