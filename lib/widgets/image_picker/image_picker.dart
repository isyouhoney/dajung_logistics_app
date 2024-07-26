import 'package:bakery_app/viewmodels/item_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomImagePicker extends StatefulWidget {
  CustomImagePicker({super.key});//, required this.image});
  // late final ValueChanged<String> image;

  @override
  State<CustomImagePicker> createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  @override
  Widget build(BuildContext context) {
    XFile? image;
    // RxString imagePath = ''.obs;
    final ImagePicker picker = ImagePicker();

    Future getImage(ImageSource imageSource) async {
      final XFile? pickedFile = await picker.pickImage(source: imageSource);
      if (pickedFile != null) {
          image = XFile(pickedFile.path);
          ItemService.to.addItemImage.value = image!.path;
          // widget.image(imagePath.value);
      }
    }

    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Container(
            height: 50,
            width: 100.w,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey.shade400,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(()=>SizedBox(width: 65.w,
                  child: Text(ItemService.to.addItemImage.value == ''?'상품 이미지 등록':ItemService.to.addItemImage.value,overflow: TextOverflow.fade,softWrap: false,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey)),
                )),
                GestureDetector(
                  onTap: () {
                    getImage(ImageSource.gallery);
                  },
                  child: const Icon(Icons.image, color: Colors.grey,),
                )
              ],
            )));
  }
}
