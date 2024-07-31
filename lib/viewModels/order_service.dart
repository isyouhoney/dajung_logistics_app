import 'package:bakery_app/repositories/order_repository.dart';
import 'package:get/get.dart';

class OrderService extends GetxService {
  final OrderRepository orderRepository = OrderRepository();
  static OrderService get to => Get.find();
  final RxString addItemCategory = '카테고리'.obs;
  final RxString addItemImage = ''.obs;
  RxList ItemList = [].obs;

  Future<RxList?> fetchOrders() async {
    var fetchedOrders = await orderRepository.getOrders();
    if (fetchedOrders != null){
      ItemList.value = fetchedOrders;
      return ItemList;
    } else {
      print('주문목록을 불러오는데 실패했습니다.');
    }
  }
  Future<List?> fetchDayTotalOrders() async {

    var fetchedDayTotalOrders = await orderRepository.getDayTotalOrders();
    if (fetchedDayTotalOrders != null){
      return fetchedDayTotalOrders;
    } else {
      print('일일 주문량을 불러오는데 실패했습니다.');
    }
  }
}