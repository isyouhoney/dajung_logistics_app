import 'package:bakery_app/models/product.dart';
import 'package:bakery_app/utils/timeFormatting.dart';
import 'package:bakery_app/view/main/stock/stock_field.dart';
import 'package:bakery_app/viewModels/production_service.dart';
import 'package:bakery_app/viewmodels/item_service.dart';
import 'package:bakery_app/view/main/stock/order_stock_panel.dart';
import 'package:bakery_app/widgets/custom_container.dart';
import 'package:bakery_app/widgets/custom_widget.dart';
import 'package:bakery_app/widgets/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DailyStock extends StatefulWidget {
  const DailyStock({super.key});

  @override
  State<DailyStock> createState() => _DailyStockState();
}

class _DailyStockState extends State<DailyStock> {
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    ItemService.to.fetchItems();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(title: '일일 생산량 등록',
      bottomSheet: CW.textButton('저장', onPressed: (){
        ProductionService.to.postProduction(products);
      }),
      child: ListView(
        children: [Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(padding: const EdgeInsets.only(left: 20),
            child: Text(dateFormat(DateTime.now().add(const Duration(days: 1))), style: Theme.of(context).textTheme.titleMedium),
          ),
          const OrderStockPanel(),
          CustomContainer(height:62.h, width: 100.w,
            child: Obx(()=>Column(crossAxisAlignment:CrossAxisAlignment.start, children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text('제품 생산량 입력', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey)),
                  ),
              Expanded(
                child: SingleChildScrollView(child: Column(children:
                ItemService.to.itemList != [] ? ItemService.to.itemList.map((e) => StockField(name: e.itemName, count: (String value) => products.add(Product(item: e, total: int.parse(value))))).toList()
                        : [const SizedBox()],)),
              )
            ]),
          ))
            ],)],
      ),);
  }
}
