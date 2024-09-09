import 'dart:io';
import 'package:bakery_app/repositories/s3_repository.dart';
import 'package:bakery_app/widgets/image_picker/image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageTile extends StatefulWidget {
  const ImageTile({super.key, required this.imageList, required this.imagePathList, this.imageSource, this.onAdded});
  final List<XFile> imageList;
  final RxList<String> imagePathList;
  final ImageSource? imageSource;
  final ValueChanged? onAdded;

  @override
  State<ImageTile> createState() => _ImageTileState();
}

class _ImageTileState extends State<ImageTile> {
  @override
  Widget build(BuildContext context) {
      return Obx(()=>GridView.builder(
        shrinkWrap: true,
        itemCount: widget.imagePathList.length + 1,
        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
          childAspectRatio: 1 / 1, //item 의 가로 1, 세로 1 의 비율
          mainAxisSpacing: 10, //수평 Padding
          crossAxisSpacing: 10, //수직 Padding
        ),
        itemBuilder: (BuildContext context,int index){
          return  Container(height: 200, padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey.shade400,
              ),
            ),
            child: index < widget.imagePathList.length ?
            GestureDetector(child: widget.imagePathList.value[index].contains('http') ?
            Image.network(widget.imagePathList.value[index]) : Image.file(File(widget.imagePathList.value[index])),
              onTap: () {
              Get.to(() => ImageViewer(url: widget.imagePathList.value[index]));
                }) :
            Center(child: IconButton(onPressed: () async => await S3Repository.to.getImage(widget.imageSource ?? ImageSource.gallery).then((image) {
              widget.imageList.add(image);
              widget.imagePathList.add(image.path);
              if(widget.onAdded != null) widget.onAdded!(null);
            }),
                icon: const Icon(Icons.add, color: Colors.grey))),
          );
        },
      ));
    }
}
