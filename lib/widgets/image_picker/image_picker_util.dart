import 'package:image_picker/image_picker.dart';

class ImagePickerUtil {
  final ImagePicker picker = ImagePicker();

  Future<XFile?> getImage(ImageSource imageSource) async {
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    return pickedFile;
  }
}
