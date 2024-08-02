import 'package:bakery_app/models/order_item.dart';
import 'package:bakery_app/models/order_sheet.dart';
import 'package:bakery_app/repositories/order_repository.dart';
import 'package:bakery_app/utils/enums.dart';
import 'package:get/get.dart';

class OrderService extends GetxService {
  final OrderRepository orderRepository = OrderRepository();
  static OrderService get to => Get.find();
  List<OrderSheet> orderSheets = [];
  RxList<OrderItem> dailyOrderList = <OrderItem>[].obs;

  Future<bool?> postOrders(DayOfWeek dayOfWeek, List<OrderItem> orderItems) async {
    var fetchedOrders = await orderRepository.postOrder(dayOfWeek, orderItems);
    if (fetchedOrders != null){
      return true;
    } else {
      print('주문목록을 불러오는데 실패했습니다.');
    }
  }

  Future<void> fetchOrderSheets() async {
    var fetchedOrderSheets = await orderRepository.getOrderSheets();
    if (fetchedOrderSheets != null){
      orderSheets = fetchedOrderSheets;
    } else {
      print('주문서을 불러오는데 실패했습니다.');
    }
  }

  Future<void> fetchTodayOrderSheets(DayOfWeek dayOfWeek) async {
    dailyOrderList.value = [];
    if (orderSheets.isNotEmpty) {
      orderSheets.map((orderSheet){
        if(orderSheet.dayOfTheWeek == dayOfWeek){
          dailyOrderList.value = orderSheet.orderItems;
        }
      }).toList();
    } else {
      print('주문서을 불러오는데 실패했습니다.');
    }
  }

  Future<List<OrderItem>?> fetchDayOrders(DayOfWeek dayOfWeek) async {
    var fetchedDayOrders = await orderRepository.getDayOrders(dayOfWeek);
    if (fetchedDayOrders != null){
      return fetchedDayOrders;
    } else {
      print('요일별 주문서을 불러오는데 실패했습니다.');
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