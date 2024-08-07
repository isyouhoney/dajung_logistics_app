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
  RxList orderReports = [].obs;
  List initList = [];
  RxBool isChanged = false.obs;

  Future<bool?> postOrders(DayOfWeek dayOfWeek, List<OrderItem> orderItems) async {
    var fetchedOrders = await orderRepository.postOrder(dayOfWeek, orderItems);
    if (fetchedOrders != null){
      return true;
    } else {
      print('주문서 저장에 실패했습니다.');
    }
  }

  Future<void> fetchOrderSheets() async {
    orderSheets = [];
    var fetchedOrderSheets = await orderRepository.getOrderSheets();
    if (fetchedOrderSheets != null){
      orderSheets = fetchedOrderSheets;
      // print(orderSheets);
    } else {
      print('주간 주문서을 불러오는데 실패했습니다.');
    }
  }

  Future<List?> fetchTodayOrderSheets(DayOfWeek dayOfWeek) async {
    dailyOrderList.value = [];
    if (orderSheets.isNotEmpty) {
      orderSheets.map((orderSheet){
        if(orderSheet.dayOfTheWeek == dayOfWeek){
          dailyOrderList.value = orderSheet.orderItems;
          return dailyOrderList.value;
        }
      }).toList();
    } else {
      print('일일 주문서을 불러오는데 실패했습니다.');
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

  Future<List?> fetchDayOrderHistory(DateTime orderStartDate,DateTime orderEndDate) async {
    var fetchedDayOrderHistory = await orderRepository.getOrderHistory(orderStartDate, orderEndDate);
    if (fetchedDayOrderHistory != null){
      orderReports.value = fetchedDayOrderHistory;
      return orderReports;
    } else {
      print('일일 주문서를 불러오는데 실패했습니다.');
    }
  }
}