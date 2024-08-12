import 'package:bakery_app/models/notice.dart';
import 'package:bakery_app/utils/enums.dart';
import 'package:bakery_app/utils/themeData.dart';
import 'package:bakery_app/viewmodels/auth_service.dart';
import 'package:bakery_app/viewmodels/notice_service.dart';
import 'package:bakery_app/widgets/custom_widget.dart';
import 'package:bakery_app/widgets/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoticeDetailScreen extends StatelessWidget {
  const NoticeDetailScreen({super.key, required this.notice});
  final Notice notice;

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(title: notice.title,
        appbarWidget: AuthService.to.user!.role == Role.MAIN || AuthService.to.user!.role == Role.MASTER ? TextButton(onPressed: () => NoticeService.to.deleteNotices(notice.id!).then((value){
          value == true ? CW.customDialog(context, '공지사항 삭제','공지사항이 삭제되었습니다.',() {Get.back(); Get.back(); NoticeService.to.fetchNotices(0, 10);},false):
          CW.customDialog(context, '공지사항 등록 실패','잠시 후 다시 시도해주세요.',() => Get.back(),false);
        }), child: Text('삭제', style: TextStyle(color: CC.mainColor))):const SizedBox(),
        child: SingleChildScrollView(
          child: Padding(padding: const EdgeInsets.fromLTRB(20,20,20,20),
                  child: //snapshot.data.content.contains('https://') ? Image.network(snapshot.data.content):
                  Column(
                    children: [
                      notice.images !=null? Column(children: notice.images!.map((image) => Image.network(image)).toList()) : const SizedBox(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(notice.content, style: const TextStyle(fontSize: 16, height: 1.5),),
                      ),
                    ],
                  ))

        )
    );}}

