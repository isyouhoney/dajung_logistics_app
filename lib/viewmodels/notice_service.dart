import 'package:bakery_app/models/notice.dart';
import 'package:bakery_app/repositories/notice_repository.dart';
import 'package:get/get.dart';

class NoticeService extends GetxController {
  final NoticeRepository notificationRepository = NoticeRepository();
  static NoticeService get to => Get.find();
  final RxList noticeList = <Notice>[].obs;
  // final RxList<Notification?> banner = <Notification>[].obs;

  // final Rxn<Notification> _notice = Rxn<Notification>();
  // Notification? get notice => _notice.value;

  Future<void> fetchNotices(int skip, int take) async {
    List? fetchedNotices = await notificationRepository.fetchNotices(skip, take);
    if (fetchedNotices != null) {
      noticeList.value = fetchedNotices;
    } else {
      print('공지사항을 불러오는데 실패했습니다.');
    }
  }
  Future<bool?> postNotices(Notice notice) async {
    bool? postedNotices = await notificationRepository.postNotice(notice);
    if (postedNotices != null) {
      return postedNotices;
    } else {
      print('공지사항 등록을 실패했습니다.');
    }
  }
  Future<bool?> editNotices(Notice notice) async {
    bool? editedNotices = await notificationRepository.editNotice(notice);
    if (editedNotices != null) {
      return editedNotices;
    } else {
      print('공지사항 수정을 실패했습니다.');
    }
  }
  Future<bool?> deleteNotices(int id) async {
    bool? deletedNotices = await notificationRepository.deleteNotice(id);
    if (deletedNotices != null) {
      return deletedNotices;
    } else {
      print('공지사항 삭제를 실패했습니다.');
    }
  }
}
