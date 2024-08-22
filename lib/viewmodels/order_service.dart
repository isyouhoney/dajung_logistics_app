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
  int orderSheetId=-1;

  RxDouble totalAmount = 0.0.obs;
  RxDouble settlementAmount = 0.0.obs;
  RxDouble dayAverageAmount = 0.0.obs;

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

  void getOrderHistory(DateTime selectedDay) async {
    DateTime firstDayOfMonth = DateTime(selectedDay.year, selectedDay.month, 1);
    DateTime firstDayOfNextMonth = (selectedDay.month < 12)
        ? DateTime(selectedDay.year, selectedDay.month + 1, 1)
        : DateTime(selectedDay.year + 1, 1, 1);
    DateTime lastDayOfMonth = firstDayOfNextMonth.subtract(const Duration(days: 1));

    await OrderService.to.fetchDayOrderHistory(firstDayOfMonth, firstDayOfNextMonth);
    totalAmount.value = 0.0;
    getMonthTotal(lastDayOfMonth.day);
  }

  void getMonthTotal(int numberOfDay){
    orderReports.forEach((orderSheet){
      orderSheet['data'].forEach((item){
        totalAmount.value += item['salePrice'];
      });
    });

    settlementAmount.value = totalAmount * 0.3;
    dayAverageAmount.value = totalAmount / numberOfDay;
  }
}