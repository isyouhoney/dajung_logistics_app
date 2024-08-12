import 'package:bakery_app/models/notice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'notice_detail_screen.dart';

class NoticeItem extends StatelessWidget {
  const NoticeItem({super.key, required this.notice});
  final Notice notice;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => Get.to(() => NoticeDetailScreen(notice: notice,)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15,20,15,18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Text('[공지]', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(notice.title, style: const TextStyle(fontSize: 15), maxLines: 2),
                        const SizedBox(height: 5,),
                        Text(notice.updatedAt!, style: const TextStyle(color: Colors.grey,fontSize: 14),),
                      ],
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
            const Divider(height: 1,)
          ],
        ),
    );
  }
}
