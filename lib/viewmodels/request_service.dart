import 'package:bakery_app/models/order_item.dart';
import 'package:bakery_app/models/order_sheet.dart';
import 'package:bakery_app/repositories/order_repository.dart';
import 'package:bakery_app/repositories/request_repository.dart';
import 'package:bakery_app/utils/enums.dart';
import 'package:get/get.dart';

class RequestService extends GetxService {
  final RequestRepository requestRepository = RequestRepository();
  static RequestService get to => Get.find();
  RxList<dynamic> myRequestHistory = [].obs;
  RxList<dynamic> requestList = [].obs;

  Future<bool?> postRequest(OrderItem orderItem) async {
    var fetchedRequest = await requestRepository.postRequest(orderItem);
    if (fetchedRequest != null){
      return true;
    } else {
      print('추가요청에 실패했습니다.');
    }
  }

  Future<void> fetchRequests(RequestedBy requestedBy) async {
    var fetchedRequests = await requestRepository.getRequest(requestedBy);
    if (fetchedRequests != null){
      requestedBy == RequestedBy.byOthers ? requestList.value = fetchedRequests : myRequestHistory.value = fetchedRequests;
    } else {
      print('추가요청 목록을 불러오는데 실패했습니다.');
    }
  }

  Future<bool> acceptRequest(int id) async {
    var acceptedRequest = await requestRepository.acceptRequest(id);
    if (acceptedRequest != null){
      return true;
    } else {
      print('추가요청 수락을 실패했습니다.');
      return false;
    }
  }

  Future<bool> cancelRequest(int id) async {
    var canceledRequest = await requestRepository.cancelRequest(id);
    if (canceledRequest != null){
      return true;
    } else {
      print('추가요청 수락을 실패했습니다.');
      return false;
    }
  }
}