import 'package:bakery_app/models/order.dart';
import 'package:bakery_app/repositories/delivery_repository.dart';
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
      return fetchedDeliveryDetail;
    } else {
      print('일일 주문서를 불러오는데 실패했습니다.');
    }
  }
}