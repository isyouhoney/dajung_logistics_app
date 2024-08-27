import 'package:bakery_app/repositories/order_repository.dart';
import 'package:get/get.dart';

class ReportService extends GetxService {
  final OrderRepository orderRepository = OrderRepository();
  static ReportService get to => Get.find();

  RxList orderReports = [].obs;
  RxDouble totalAmount = 0.0.obs;
  RxDouble settlementAmount = 0.0.obs;
  RxDouble dayAverageAmount = 0.0.obs;

  RxMap<DateTime, List> dayTotals = <DateTime, List>{}.obs;
  RxMap dayOrderItems = {}.obs;


  Future<List?> fetchDayOrderHistory(DateTime orderStartDate,DateTime orderEndDate) async {
    var fetchedDayOrderHistory = await orderRepository.getOrderHistory(orderStartDate, orderEndDate);
    if (fetchedDayOrderHistory != null){
      orderReports.value = fetchedDayOrderHistory;
      loadOrderData();
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

    await fetchDayOrderHistory(firstDayOfMonth, firstDayOfNextMonth);
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


  void loadOrderData() {
    if (ReportService.to.orderReports.isNotEmpty) {
      num dayTotal = 0;
      dayOrderItems.clear();
      dayTotals.clear();

      ReportService.to.orderReports.forEach((orderReport) {
        dayTotal = 0;
        orderReport['data'].forEach((item) {
          dayTotal += item['salePrice'];
        });
        dayOrderItems[DateTime.parse(orderReport['date'])] = orderReport['data'];
        dayTotals[DateTime.parse(orderReport['date'])] = [dayTotal];
      });
      print(dayOrderItems);
    }
  }
}