import 'package:bakery_app/models/item.dart';
import 'package:bakery_app/models/product.dart';
import 'package:bakery_app/utils/timeFormatting.dart';
import 'package:bakery_app/view/main/stock/stock_field.dart';
import 'package:bakery_app/view/main/stock/order_stock_panel.dart';
import 'package:bakery_app/viewmodels/item_service.dart';
import 'package:bakery_app/viewmodels/order_service.dart';
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
    await ItemService.to.fetchItems(); // ItemService.to.itemList
    await ProductionService.to.fetchTodayProduction(); //ProductionService.to.productionList
    await OrderService.to.fetchDayTotalOrders(); // OrderService.to.orderList
    List<Item> itemsToRemove = [];

    if(ProductionService.to.productionList.isNotEmpty){
      print(1);
      for (var product in ProductionService.to.productionList) {
        for (var item in ItemService.to.itemList) {
          if (product['itemName'] == item.itemName) {
            products[item] = {'total': product['total']};
            itemsToRemove.add(item);
          }
        }
      }

      for (var item in itemsToRemove) {
        ItemService.to.itemList.remove(item);
      }
    } else {
      print(2);
      for (var orderItem in OrderService.to.orderList) {
        for (var item in ItemService.to.itemList) {
          if (orderItem['itemName'] == item.itemName) {
            products[item] = {'total': orderItem['quantity']};
            itemsToRemove.add(item);
          }
        }
      }

      for (var item in itemsToRemove) {
        ItemService.to.itemList.remove(item);
      }
    }
    // print(products);
  }

  Future<bool?> postProduction() async {
    List<Product> productList = [];
    bool? isPosted;

    products.forEach((item, map) {
      int total = map['total'];
      productList.add(Product(item: item, total: total));
    });

    isPosted = ProductionService.to.id == -1 ? await ProductionService.to.postProduction(productList) : await ProductionService.to.editProduction(productList);
    return isPosted;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(title: '일일 생산량 등록',
      bottomSheet: CW.textButton('저장', onPressed: () => postProduction().then((value) => CW.dajungDialog(context, value! ? '오늘의 제품 생산량이 저장되었습니다.' : '오늘의 제품 생산량 저장이 실패습니다.\n다시 한번 시도해주세요.', '확인', () {Get.back(); value! ? Get.back() : null;}, false))),
      child: ListView(
        children: [Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(padding: const EdgeInsets.only(left: 20),
            child: Text(dateFormat(DateTime.now().add(const Duration(days: 2))), style: Theme.of(context).textTheme.titleMedium),
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
                  Obx(() => Column(
                    children: products.isNotEmpty ? products.entries.map<Widget>((e) => StockField(
                      name: e.key.itemName,
                      quantity: e.value['total'],
                      initValue: e.value['total'],
                      isCounted: (String value) => e.value['total'] = int.parse(value),
                    )).toList() : [const SizedBox()],
                  )),
                  Obx(() => Column(
                    children: ItemService.to.itemList.isNotEmpty ? ItemService.to.itemList.map<Widget>((e) => StockField(
                      name: e.itemName,
                      // initValue: e.value['total'],
                      isCounted: (String value) {
                          products[e] = {'total': int.parse(value)};
                          ItemService.to.itemList.remove(e);
                      },
                    )).toList() : [const SizedBox()],
                  )),
                ]),
                ),
              )
            ]),
          )
            ],)],
      ),);
  }
}
