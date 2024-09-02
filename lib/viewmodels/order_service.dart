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
  Rx<DateTime> selectDay = DateTime.now().obs;

  List initList = [];
  RxBool isChanged = false.obs;
  int orderSheetId=-1;

  RxList orderList = [].obs;


  Future<bool?> postOrders(DayOfWeek dayOfWeek, List orderItems) async {
    bool? fetchedOrders;
    if(initList.isEmpty){
      print('post');
      fetchedOrders = await orderRepository.postOrder(dayOfWeek, orderItems);
    } else {
      print('orderSheetId : $orderSheetId');
      fetchedOrders = await orderRepository.editOrder(dayOfWeek, orderItems, orderSheetId);
    }
    if (fetchedOrders != null){

      return true;
    } else {
      print('주문서 저장에 실패했습니다.');
    }
  }

  Future<void> fetchOrderSheets() async {
    orderSheets = [];
    orderSheetId=-1;
    var fetchedOrderSheets = await orderRepository.getOrderSheets();
    if (fetchedOrderSheets != null){
      orderSheets = fetchedOrderSheets;
    } else {
      print('주간 주문서을 불러오는데 실패했습니다.');
    }
  }

  Future<void> fetchTodayOrderSheets(DayOfWeek dayOfWeek) async {
    dailyOrderList.value = [];
    if (orderSheets.isNotEmpty) {
      orderSheets.forEach((orderSheet){
        if(orderSheet.dayOfTheWeek == dayOfWeek){
          orderSheetId = orderSheet.id!;
          dailyOrderList.value = orderSheet.orderItems;
          initList = orderSheet.orderItems;
        }
      });
    } else {
      print('일일 주문서을 불러오는데 실패했습니다.');
    }
  }


  Future<List?> fetchDayTotalOrders() async {
    var fetchedDayTotalOrders = await orderRepository.getDayTotalOrders();
    if (fetchedDayTotalOrders != null){
      orderList.value = fetchedDayTotalOrders;
      return orderList;
    } else {
      print('일일 주문량을 불러오는데 실패했습니다.');
    }
  }

}