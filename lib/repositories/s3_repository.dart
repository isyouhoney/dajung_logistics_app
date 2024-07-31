import 'dart:convert';
import 'package:bakery_app/viewmodels/item_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:uuid/uuid.dart';

class S3Repository extends GetxController {
  static S3Repository get to => Get.find();
  String? contentType;
  String objectKey = ''; // Presigned URL 생성 시 filename 저장 예정
  final String bucketUrl = dotenv.get("DAJUNG_PRESIGNED_URL");
  final String s3Url = dotenv.get("DAJUNG_S3_URL");
  XFile? image;
  bool isImageUpdated = false;
  String objectUrl='';

  Future getImage(ImageSource imageSource) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    if (pickedFile != null) {
      image = XFile(pickedFile.path);
      contentType = lookupMimeType(pickedFile.path)!;
      // getPresignedUrl();
      ItemService.to.addItemImage.value = image!.path;
      isImageUpdated = true;
    }
  }

  Future<void> getPresignedUrl() async {
    try {
      final String uniqueFilename = '${const Uuid().v4()}.${contentType?.split('/').last}';
      final String filename = Uri.encodeComponent(uniqueFilename);

      final url = Uri.parse('$bucketUrl/getPresignedUrl?filename=$filename&contentType=$contentType');
      final response = await http.get(url); // AWS API에 Presigned URL 만드는 요청

      final Map<String, dynamic> responseData = json.decode(response.body);

      if (responseData['statusCode'] == 200) {
        final Map<String, dynamic> bodyData = json.decode(responseData['body']);
        final String presignedUrl = bodyData['url'];
        objectKey = filename; // 이미지 URL 얻을 때 필요한 filename

        await uploadImageToS3(presignedUrl, image);
        print('Succeeded to get presigned URL: $presignedUrl');
      } else {
        print('Failed to get presigned URL: ${response.body}');
      }
    } catch (e) {
      print('Failed to get presigned URL: $e');
    }
  }

  Future<String?> uploadImageToS3(String presignedUrl, XFile? _image) async {
    try {
      final bytes = await _image!.readAsBytes();

      // S3 버킷에 이미지 업로드 요청
      final uploadImageResponse = await http.put(
        Uri.parse(presignedUrl),
        headers: {
          'Content-Type': contentType!,
        },
        body: bytes,
      );

      if (uploadImageResponse.statusCode == 200) {
        objectUrl = '$s3Url/$objectKey';
        return objectUrl;
      } else {
        print('Failed to upload a image: ${uploadImageResponse.body}');
      }
    } catch (e) {
      print('Failed to upload a image: $e');
    }
  }
}