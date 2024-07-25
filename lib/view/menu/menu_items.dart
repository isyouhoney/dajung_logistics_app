import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MenuItem extends StatelessWidget {
   MenuItem({super.key, required this.img, required this.title, required this.item, this.dividerShow = true});
  final String img;
  final String title;
  final List<Widget> item;
  bool dividerShow;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
              child: Row(
                children: [
                  SvgPicture.asset(img, fit: BoxFit.contain, width: 4.pt),
                  SizedBox(width: 3.pt),
                  Text(
                    title,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
            ...item,
            dividerShow! ? const Divider(height: 1,color: Colors.grey) : const SizedBox()
          ],
        ),
    );
  }

}

class MenuContent extends StatelessWidget {
  const MenuContent({super.key, required this.text, required this.onPress});
  final String text;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 100.w,
        child: Material(
          color: Colors.white,
          child: InkWell(
            onTap: onPress,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 3.0.pt, vertical: 3.5.pt),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    text,
                    style: TextStyle( fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  SvgPicture.asset(
                    'assets/icons/arrow_forward.svg',
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

