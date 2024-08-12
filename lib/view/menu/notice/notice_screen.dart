import 'package:bakery_app/models/user.dart';
import 'package:bakery_app/repositories/s3_repository.dart';
import 'package:bakery_app/utils/enums.dart';
import 'package:bakery_app/view/menu/notice/notice_item.dart';
import 'package:bakery_app/view/menu/notice/notice_registration.dart';
import 'package:bakery_app/viewmodels/auth_service.dart';
import 'package:bakery_app/viewmodels/notice_service.dart';
import 'package:bakery_app/widgets/custom_container.dart';
import 'package:bakery_app/widgets/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoticeScreen extends StatefulWidget {
  const NoticeScreen({super.key});

  @override
  State<NoticeScreen> createState() => _NoticeScreenState();
}

class _NoticeScreenState extends State<NoticeScreen> {
  User user = AuthService.to.user!;
  int skip = 0;
  int take = 10;

  @override
  void initState() {
    super.initState();
    NoticeService.to.fetchNotices(skip, take);
    S3Repository();
    // _scrollController = ScrollController();
    // _scrollController.addListener(_onScroll);
    // _fetchMoreData();
  }

  // bool hasMoreData = true;
  // late ScrollController _scrollController;

  // void _fetchMoreData() {
  //   if (isLoading) return;
  //   setState(() => isLoading = true);
  //
  //   // 가상 데이터 추가 로직
  //   Future.delayed(const Duration(seconds: 2), () {
  //     setState(() {
  //       var newRecords = List.generate(fetchThreshold,
  //           (index) => Notice(title: "공지사항 제목입니다", id: index + notices.length));
  //       if (newRecords.isEmpty) {
  //         hasMoreData = false; // 더 이상 로드할 데이터가 없음
  //       } else {
  //         notices.addAll(newRecords);
  //       }
  //       isLoading = false;
  //     });
  //   });
  // }

  // void _onScroll() {
  //   if (_scrollController.position.pixels ==
  //       _scrollController.position.maxScrollExtent) {
  //     _fetchMoreData();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(title: '공지사항', appbarWidget: user.role == Role.MAIN || user.role == Role.MASTER ? IconButton(onPressed: () => Get.to(() => const NoticeRegistration()), icon: const Icon(Icons.add),):const SizedBox(),
        child: Obx(() => NoticeService.to.noticeList.isNotEmpty
                  ? SingleChildScrollView(
                      child: Column(children:
                      NoticeService.to.noticeList.map((notice) => NoticeItem(notice: notice,)).toList()
                      ),
                    )
                  : const Center(child: CustomContainer(child: Text('공지사항이 없습니다.', style: TextStyle(fontSize: 16, color: Colors.grey),)))
    ));
  }
}
