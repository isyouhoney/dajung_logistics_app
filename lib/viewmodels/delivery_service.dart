import 'package:bakery_app/models/order.dart';
import 'package:bakery_app/models/recall.dart';
import 'package:bakery_app/models/user.dart';
import 'package:bakery_app/repositories/delivery_repository.dart';
import 'package:bakery_app/utils/enums.dart';
import 'package:get/get.dart';

class DeliveryService extends GetxService {
  final DeliveryRepository deliveryRepository = DeliveryRepository();
  static DeliveryService get to => Get.find();
  RxList deliveryList = [].obs;

  Future<List?> fetchDeliveryHistory(int skip, int take) async {
    var fetchedDeliveryHistory = await deliveryRepository.getDeliveryHistory(skip, take);
    if (fetchedDeliveryHistory != null){
      deliveryList.value = fetchedDeliveryHistory;
      return deliveryList;
    } else {
      print('일일 주문서를 불러오는데 실패했습니다.');
    }
  }

  Future<Order?> fetchDeliveryDetail(DateTime today,DateTime yesterday) async {
    var fetchedDeliveryDetail = await deliveryRepository.getDeliveryDetail(today, yesterday);
    if (fetchedDeliveryDetail != null){
      print(fetchedDeliveryDetail.status);
      return fetchedDeliveryDetail;
    } else {
      print('일일 주문서를 불러오는데 실패했습니다.');
    }
  }

  Future<bool> checkDelivery(DateTime today) async {
    var checkedDelivery = await deliveryRepository.checkDelivery(today, today.subtract(const Duration(days: 1)));
    if (checkedDelivery != null){
      return checkedDelivery;
    } else {
      print('배송 확인에 실패했습니다.');
      return false;
    }
  }

  Future<bool?> postDelivery(User store,List<String> images, Recall? recall) async {
    var postedDelivery = await deliveryRepository.postDelivery(store, images, recall : recall);
    if (postedDelivery != null){
      return postedDelivery;
    } else {
      print('일일 주문서를 불러오는데 실패했습니다.');
    }
  }

  Future<List?> fetchDayOrders(DayOfWeek dayOfWeek) async {
    var fetchedDayOrders = await deliveryRepository.getDayOrders(dayOfWeek);
    if (fetchedDayOrders != null){
      deliveryList.value = fetchedDayOrders;
      return deliveryList.value;
    } else {
      print('요일별 주문서을 불러오는데 실패했습니다.');
    }
  }
}