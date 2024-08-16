import 'package:bakery_app/models/item.dart';
import 'package:bakery_app/models/product.dart';
import 'package:bakery_app/utils/timeFormatting.dart';
import 'package:bakery_app/view/main/stock/stock_field.dart';
import 'package:bakery_app/view/main/stock/order_stock_panel.dart';
import 'package:bakery_app/viewmodels/item_service.dart';
import 'package:bakery_app/viewmodels/production_service.dart';
import 'package:bakery_app/widgets/custom_container.dart';
import 'package:bakery_app/widgets/custom_widget.dart';
import 'package:bakery_app/widgets/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DailyStock extends StatefulWidget {
  const DailyStock({super.key});

  @override
  State<DailyStock> createState() => _DailyStockState();
}

class _DailyStockState extends State<DailyStock> {
  RxMap products = {}.obs;
  DateTime postDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    getProduction();
  }

  Future getProduction() async {
    await ItemService.to.fetchItems();
    await ProductionService.to.fetchProduction(DateTime.now(), DateTime.now().add(const Duration(days: 1)));
    List<Item> itemsToRemove = [];

    for (var product in ProductionService.to.productionList[0]['data']) {
      for (var item in ItemService.to.itemList) {
        if (product['itemName'] == item.itemName) {
          products[item] = {'total': product['productionAmount']};
          itemsToRemove.add(item);
        }
      }
      print(ProductionService.to.productionList[0]['date']);
    }

    for (var item in itemsToRemove) {
      ItemService.to.itemList.remove(item);
    }
  }

  Future<bool?> postProduction() async {
    List<Product> productList = [];
    bool? isPosted;

    products.forEach((item, map) {
      int total = map['total'];
      productList.add(Product(item: item, total: total));
    });

    isPosted = await ProductionService.to.postProduction(productList, ProductionService.to.productionList[0]['date']);
    return isPosted;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(title: '일일 생산량 등록',
      bottomSheet: CW.textButton('저장', onPressed: () => postProduction().then((value) => CW.dajungDialog(context, '오늘의 제품 생산량이 저장되었습니다.', '확인', () {Get.back(); Get.back();}, false))),
      child: ListView(
        children: [Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(padding: const EdgeInsets.only(left: 20),
            child: Text(dateFormat(DateTime.now().add(const Duration(days: 1))), style: Theme.of(context).textTheme.titleMedium),
          ),
          const OrderStockPanel(),
          CustomContainer(height:62.h, width: 100.w,
            child: Column(crossAxisAlignment:CrossAxisAlignment.start, children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text('제품 생산량 입력', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey)),
                  ),
              Expanded(
                child: SingleChildScrollView(child: Column(children: [
                Obx(() => Column(children: products.isNotEmpty ? products.entries.map<Widget>((e) =>
                    StockField(name: e.key.itemName, quantity: e.value['total'], count: (String value) => e.value['total'] = int.parse(value))).toList()
                            : [const SizedBox()])),
                Obx(() => Column(children: ItemService.to.itemList.isNotEmpty ? ItemService.to.itemList.map<Widget>((e) =>
                    StockField(name: e.itemName, count: (String value) => products[e] = {'total': int.parse(value)})).toList() // products.add(Product(item: e, total: int.parse(value)))
                            : [const SizedBox()],)),
                  ],
                )),
              )
            ]),
          )
            ],)],
      ),);
  }
}
