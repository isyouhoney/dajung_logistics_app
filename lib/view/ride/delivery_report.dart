import 'package:bakery_app/models/item.dart';
import 'package:bakery_app/models/order.dart';
import 'package:bakery_app/models/order_item.dart';
import 'package:bakery_app/models/order_sheet.dart';
import 'package:bakery_app/models/recall.dart';
import 'package:bakery_app/repositories/s3_repository.dart';
import 'package:bakery_app/utils/enums.dart';
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
import 'package:intl/intl.dart';

class DeliveryReport extends StatefulWidget {
  const DeliveryReport({super.key, required this.order});
  final Order order;

  @override
  State<DeliveryReport> createState() => _DeliveryReportState();
}

class _DeliveryReportState extends State<DeliveryReport> {
  int total = 0;

  OrderSheet recallOrderSheet = OrderSheet(dayOfTheWeek: DayOfWeek.fromKor(DateFormat('E', 'ko_KR').format(DateTime.now())), orderItems: []);
  Map<Item,Map> recallItems = {};

  List<XFile>? imageList = [];
  RxList<String>? imagePathList = <String>[].obs;
  List<String>? postImagePathList = <String>[];

  List<XFile>? returnImageList = [];
  RxList<String>? returnImagePathList = <String>[].obs;
  List<String> postReturnImagePathList = <String>[];

  RxBool isLoading = false.obs;
  RxBool complete = false.obs;

  @override
  void initState() {
    super.initState();
    getTotal();
  }

  void getTotal(){
    for (var value in widget.order.orderSheet.orderItems) {
      total += value.quantity;
    }
  }

  Future<bool?> postNotice() async {
    isLoading.value = true;

    try {
      if (imageList != null) {
        await Future.wait(imageList!.map((image) async =>
        postImagePathList = (await S3Repository.to.getPresignedUrl(image))!).toList());
        print(postImagePathList);
        S3Repository.to.objectUrl.clear();
      }
      if (returnImageList != null) {
        await Future.wait(returnImageList!.map((image) async =>
        postReturnImagePathList = (await S3Repository.to.getPresignedUrl(image))!).toList());
        print(postReturnImagePathList);
      }
      List<OrderItem> recallOrderItems = [];
      recallItems.forEach((item, map) {
        int quantity = map['quantity'];
        recallOrderItems.add(OrderItem(item: item, quantity: quantity));
      });
      complete.value = (await DeliveryService.to.postDelivery(
          widget.order.orderSheet.orderer!, postImagePathList!,
          recallOrderItems.isNotEmpty
              ? Recall(
              images: postReturnImagePathList, recallItems: recallOrderItems)
              : Recall(images: postReturnImagePathList, recallItems: [])
      ))!;

      return complete.value;
    } finally {
      isLoading.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(title: '배송 및 회수 확인',
      bottomSheet: Obx(() => isLoading.value ? loadingButton()
          : CW.textButton(complete.value ? '배송/회수 완료되었습니다.' : '배송/회수 완료 보고',
          onPressed: () => !complete.value && !isLoading.value ? postNotice() : null,
          color: complete.value || isLoading.value ? Colors.grey : CC.mainColor)),
      child: SingleChildScrollView(child: Column(children: [
        FoldPanel(initExpand: true, titleWidget: StorenameField(name: widget.order.orderSheet.orderer!.storeName!,
            child: Text('총 $total 개', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey))),
            bodyWidget: SingleChildScrollView(child: Column(children: widget.order.orderSheet.orderItems.map((e) =>
                StockField(name: e.item.itemName, quantity: e.quantity)).toList()))),
        widget.order.orderSheet.orderItems.isNotEmpty ?
        CustomContainer(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            titleField('배송 사진 등록', const Icon(Icons.camera_alt_outlined, color: Colors.grey,)),
            ImageTile(imageList: imageList!, imagePathList: imagePathList!, imageSource: ImageSource.camera,)
          ],)) : const SizedBox(),
        CustomContainer(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          titleField('회수 물량', Icon(Icons.remove_circle_outline, color: CC.redColor,)),
            Column(children: widget.order.recall != null ? widget.order.recall!.recallItems.map<Widget>((orderItem) =>
                StockField(name: orderItem.item.itemName,
                isCounted: (String value) => recallItems[orderItem.item] = {'quantity': int.parse(value)}
              )).toList() : [const Text('회수할 상품이 없습니다.')]),
            titleField('회수 사진 등록', const Icon(Icons.camera_alt_outlined, color: Colors.grey,)),
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

  Widget loadingButton(){
    return Container(
        width: double.maxFinite,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(12),),
        child: const Center(child: SizedBox(width:25, height:25, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 5)))) ;
  }
}
