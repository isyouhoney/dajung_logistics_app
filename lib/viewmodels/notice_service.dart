import 'package:bakery_app/repositories/notification_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoticeController extends GetxController {
  final NotificationRepository notificationRepository = NotificationRepository();
  static NoticeController get to => Get.find();
  final RxList noticeList = <Notification>[].obs;
  final RxList<Notification?> banner = <Notification>[].obs;

  final Rxn<Notification> _notice = Rxn<Notification>();
  Notification? get notice => _notice.value;

  // 공지사항 전체 조회
  // Future<void> fetchNotices() async {
  //   List? fetchedNotices = await notificationRepository.fetchNotices(int skip, int take);
  //   if (fetchedNotices != null) {
  //     noticeList.value = fetchedNotices;
  //   } else {
  //     print('공지사항을 불러오는데 실패했습니다.');
  //   }
  // }

  // Future<Notification?> fetchNoticeDetail(int noticeId) async {
  //   var fetchedOneNotice = await notificationRepository.fetchNoticeDetail(noticeId);
  //   if (fetchedOneNotice != null) {
  //     _notice.value = fetchedOneNotice;
  //     return _notice.value;
  //   } else {
  //     print('공지사항 상세를 불러오는데 실패했습니다.');
  //   }
  // }
  //
  // // FAQ 전체 조회
  // Future<void> fetchFAQ() async {
  //   var fetchedFaqs = await notificationRepository.fetchFAQs();
  //   if (fetchedFaqs != null) {
  //     faqList.value = fetchedFaqs;
  //   } else {
  //     print('FAQ를 불러오는데 실패했습니다.');
  //   }
  // }
  //
  // // Banner 조회
  // Future<void> fetchBanner() async {
  //   var fetchBanner = await notificationRepository.fetchBanner(homeFixed: true, modal: false);
  //   if (fetchBanner != null) {
  //     banner.value = fetchBanner;
  //   } else {
  //     print('Banner를 불러오는데 실패했습니다.');
  //   }
  // }
  //
  // // modal event 조회
  // Future<List<Notification>?> fetchEventModal() async {
  //   var fetchEventModal = await notificationRepository.fetchBanner(homeFixed: false, modal: true);
  //   if (fetchEventModal != null) {
  //     print('fetchEventModal : $fetchEventModal');
  //     return fetchEventModal;
  //   } else {
  //     print('fetchEventModal 불러오는데 실패했습니다.');
  //   }
  // }
}
