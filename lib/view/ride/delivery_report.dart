import 'dart:ffi';

import 'package:bakery_app/models/item.dart';
import 'package:bakery_app/models/order_item.dart';
import 'package:bakery_app/models/order_sheet.dart';
import 'package:bakery_app/models/recall.dart';
import 'package:bakery_app/repositories/s3_repository.dart';
import 'package:bakery_app/utils/themeData.dart';
import 'package:bakery_app/view/main/stock/stock_field.dart';
import 'package:bakery_app/viewmodels/delivery_service.dart';
import 'package:bakery_app/widgets/custom_container.dart';
import 'package:bakery_app/widgets/custom_widget.dart';
import 'package:bakery_app/widgets/default_layout.dart';
import 'package:bakery_app/widgets/fold_pannel.dart';
import 'package:bakery_app/widgets/image_picker/image_tile.dart';
import 'package:bakery_app/widgets/storename_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:image_picker/image_picker.dart';

class DeliveryReport extends StatefulWidget {
  const DeliveryReport({super.key, required this.orderSheet});
  final OrderSheet orderSheet;

  @override
  State<DeliveryReport> createState() => _DeliveryReportState();
}

class _DeliveryReportState extends State<DeliveryReport> {
  int total = 0;

  List<XFile>? imageList = [];
  RxList<String>? imagePathList = <String>[].obs;
  List<String>? postImagePathList = <String>[];

  List<XFile>? returnImageList = [];
  RxList<String>? returnImagePathList = <String>[].obs;
  List<String>? postReturnImagePathList = <String>[];

  Map<Item,Map> recallItems = {};
  RxBool complete = false.obs;
  
  @override
  void initState() {
    super.initState();
    getTotal();
    S3Repository.to.objectUrl.clear();
  }
  
  void getTotal(){
    for (var value in widget.orderSheet.orderItems) {
      total += value.quantity;
    }
  }

  Future<bool?> postNotice() async {
    print('imageList : $imageList');
    if (imageList != null) {
      await Future.wait(imageList!.map((image) async => postImagePathList = (await S3Repository.to.getPresignedUrl(image))!).toList());
    }
    if (returnImageList != null) {
      await Future.wait(returnImageList!.map((image) async => postReturnImagePathList = (await S3Repository.to.getPresignedUrl(image))!).toList());
    }
    List<OrderItem> recallOrderItems = [];
    recallItems.forEach((item, map) {
      int quantity = map['quantity'];
      recallOrderItems.add(OrderItem(item: item, quantity: quantity));
    });
    complete.value = (await DeliveryService.to.postDelivery(widget.orderSheet.orderer!,postImagePathList!,recallOrderItems.isNotEmpty ? Recall(images: postReturnImagePathList??[], recallItems: recallOrderItems) : Recall(images: [], recallItems: [])
    ))!;

    return complete.value;
  }
  
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(title: '배송 및 회수 확인',
      bottomSheet: Obx(()=>CW.textButton(complete.value ? '배송이 완료되었습니다.' : '배송 완료 보고', onPressed: () => postNotice(), color: complete.value ? Colors.grey : CC.mainColor)), child: SingleChildScrollView(child: Column(children: [
        FoldPanel(initExpand: true, titleWidget: StorenameField(name: widget.orderSheet.orderer!.storeName!, child: Text('총 $total 개', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey))),
            bodyWidget: SingleChildScrollView(child: Column(children:
        widget.orderSheet.orderItems.map((e) => StockField(name: e.item.itemName, quantity: e.quantity)).toList()))),
          CustomContainer(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            titleField('배송 사진 등록', const Icon(Icons.camera_alt_outlined)),
            ImageTile(imageList: imageList!, imagePathList: imagePathList!, imageSource: ImageSource.camera,)
          ],)),
          CustomContainer(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            titleField('회수 물량', const Icon(Icons.remove_circle_outline)),
            Column(children:widget.orderSheet.orderItems.map((e) => StockField(name: e.item.itemName,
                count: (String value) {
              recallItems[e.item] = {'quantity': int.parse(value)};
            })).toList()),
            titleField('회수 사진 등록', const Icon(Icons.camera_alt_outlined)),
            ImageTile(imageList: returnImageList!, imagePathList: returnImagePathList!, imageSource: ImageSource.camera)
          ]))])
    ));
  }

  Widget titleField(String title, Icon titleIcon){
    return Padding(
      padding: const EdgeInsets.fromLTRB(5,5,0,10),
      child: Row(
        children: [
          titleIcon,
          const SizedBox(width: 5,),
          Text(title, style: Theme.of(context).textTheme.titleMedium),
        ],
      ),
    );
  }
}
