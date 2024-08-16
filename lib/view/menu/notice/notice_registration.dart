import 'dart:io';

import 'package:bakery_app/models/notice.dart';
import 'package:bakery_app/repositories/s3_repository.dart';
import 'package:bakery_app/utils/themeData.dart';
import 'package:bakery_app/viewmodels/notice_service.dart';
import 'package:bakery_app/widgets/custom_textfield.dart';
import 'package:bakery_app/widgets/custom_widget.dart';
import 'package:bakery_app/widgets/image_picker/image_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class NoticeRegistration extends StatefulWidget {
  const NoticeRegistration({super.key});

  @override
  State<NoticeRegistration> createState() => _NoticeRegistrationState();
}

class _NoticeRegistrationState extends State<NoticeRegistration> {
  RxBool all = false.obs;
  RxBool main = false.obs;
  RxBool sub = false.obs;
  late TextEditingController titleController;
  late TextEditingController contentController;
  List<XFile>? imageList = [];
  RxList<String>? imagePathList = <String>[].obs;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    contentController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    contentController.dispose();
  }

  Future<bool?> postNotice() async {
    if (imageList != null) {
      await Future.wait(imageList!.map((image) async => await S3Repository.to.getPresignedUrl(image)).toList());
    }
    bool? status = await NoticeService.to.postNotices(
      Notice(title: titleController.text, content: contentController.text, topFixed: false, images: S3Repository.to.objectUrl,),
    );

    return status;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('공지사항 작성'),
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new), onPressed: () => CW.customDialog(context, '주의','이탈 시 작성중인 내용이 저장되지 않습니다.\n뒤로 이동하시겠습니까?',() {Get.back(); Get.back();},false)),
        actions: [
          TextButton(onPressed: () => postNotice().then((value){
            value == true ? CW.customDialog(context, '작성 완료','공지사항이 등록되었습니다.',() {Get.back(); Get.back(); NoticeService.to.fetchNotices(0, 10);},false)
                :CW.customDialog(context, '공지사항 등록 실패','다시 한번 시도해주세요.',() => Get.back(),false);
    }), child: const Text('등록'))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(children: [
            CustomTextField(hintText: '제목을 입력해주세요.', controller: titleController),
            Obx(()=>
                Row(
                  children: [
                    typeCheckBox(all,'전체'),
                    typeCheckBox(main,'직영점'),
                    typeCheckBox(all,'개인 카페'),
                  ],
                ),
            ),
            CustomTextField(hintText: '내용을 입력해주세요.', maxLine: 10, counterText: true, maxLength: 500, controller: contentController),
            ImageTile(imageList: imageList!, imagePathList: imagePathList!)
          ],),
        ),
      ),
    );
  }

Widget typeCheckBox(RxBool val, String type){
  return Row(children: [
    Checkbox(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      value: val.value, onChanged: (value){val.value = value!;}, activeColor: CC.mainColor, side: const BorderSide(width: 0.5),),
    Text(type),
    const SizedBox(width: 10,)
  ],);
}

// Widget imageTile(){
//     return Obx(()=>GridView.builder(
//       shrinkWrap: true,
//       itemCount: imagePathList!.length < 5 ?imagePathList!.length +1 : imagePathList!.length,
//       gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
//         childAspectRatio: 1 / 1, //item 의 가로 1, 세로 1 의 비율
//         mainAxisSpacing: 10, //수평 Padding
//         crossAxisSpacing: 10, //수직 Padding
//       ),
//       itemBuilder: (BuildContext context,int index){
//         // return Text(index.toString());
//         return  Container(height: 200, padding: const EdgeInsets.all(10),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             border: Border.all(
//               color: Colors.grey.shade400,
//             ),
//           ),
//           child: index < imagePathList!.length ? Image.file(File(imagePathList!.value[index])) :
//           Center(child: IconButton(onPressed: () async => await S3Repository.to.getImage(ImageSource.gallery).then((image) {
//             imageList?.add(image);
//             imagePathList?.add(image.path);
//           }),
//               icon: const Icon(Icons.add, color: Colors.grey))),
//         );
//       },
//     ));
// }
}
