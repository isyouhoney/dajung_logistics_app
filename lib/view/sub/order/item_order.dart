import 'package:bakery_app/utils/enums.dart';
import 'package:bakery_app/utils/themeData.dart';
import 'package:bakery_app/view/sub/order/widgets/day_of_week_selector.dart';
import 'package:bakery_app/view/sub/order/widgets/order_form.dart';
import 'package:bakery_app/viewmodels/order_service.dart';
import 'package:bakery_app/widgets/custom_widget.dart';
import 'package:bakery_app/widgets/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemOrder extends StatefulWidget {
  const ItemOrder({super.key});

  @override
  State<ItemOrder> createState() => _ItemOrderState();
}

class _ItemOrderState extends State<ItemOrder> {
  DayOfWeek dayOfWeek = DayOfWeek.mon;

  @override
  void initState() {
    super.initState();
    getOrders();

  }

  Future getOrders() async {
    OrderService.to.isChanged.value = false;
    OrderService.to.dailyOrderList.value = [];
    await OrderService.to.fetchOrderSheets();
    await OrderService.to.fetchTodayOrderSheets(dayOfWeek);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        title: '상품 주문서',
        bottomSheet: Obx(() => CW.textButton('저장하기', color: OrderService.to.isChanged.value ? CC.mainColor : Colors.grey, onPressed: (){
          OrderService.to.isChanged.value ? OrderService.to.postOrders(dayOfWeek, OrderService.to.dailyOrderList.value).then((value){
            CW.dajungDialog(context, value != null ? '${dayOfWeek.kor}요일 주문서가 저장되었습니다.':'', '확인', () => Get.back(), false);
            OrderService.to.isChanged.value = false;
            getOrders();
          }) : null;
        })),
        child: Column(children: [
            DayOfWeekSelector(dayOfWeek: (value) => dayOfWeek = value,
                onChange: (value) => getOrders()),
            const OrderForm()
        ],
        ),
    );
  }
}
