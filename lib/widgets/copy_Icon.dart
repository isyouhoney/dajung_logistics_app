import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class CopyIcon extends StatelessWidget {
  const CopyIcon({super.key, required this.copyText});
  final String copyText;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          children: [
            SvgPicture.asset('assets/icons/copy_icon.svg', height: 18),
            const Text('주소복사', style: TextStyle(color: Colors.grey),)
          ],
        ),
      ),
      onTap: () {
        Clipboard.setData(
            ClipboardData(text: copyText));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('복사되었습니다.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Noto Sans',
                  fontWeight: FontWeight.w500),
            ),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            width: 150,
          ),
        );
      },
    );
  }
}
