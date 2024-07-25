// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class NoticeDetailScreen extends StatefulWidget {
//   const NoticeDetailScreen({super.key});
//
//   @override
//   State<NoticeDetailScreen> createState() => _NoticeDetailScreenState();
// }
//
// class _NoticeDetailScreenState extends State<NoticeDetailScreen> {
//
//
//
//   @override
//   Widget build(BuildContext context) {
//   final noticeId = Get.parameters['noticeId'] != null
//       ? int.tryParse(Get.parameters['noticeId']!)
//       : 0;
//     return
//       FutureBuilder(
//       future: NoticeController.to.fetchNoticeDetail(noticeId!),
//       builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           print('error : ${snapshot.error}');
//           return const SizedBox();
//         }
//         return snapshot.data != null ?
//         Scaffold(
//         appBar: AppBar(
//           title : AutoSizeText(snapshot.data.title, maxLines: 2),
//           centerTitle: true,
//         ),
//         body: SingleChildScrollView(
//           child: Padding(padding: const EdgeInsets.fromLTRB(20,20,20,20),
//                   child: snapshot.data.content.contains('https://') ? Image.network(snapshot.data.content):Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 5),
//                     child: Text(snapshot.data.content, style: const TextStyle(fontSize: 16, height: 1.5),),
//                   ))
//
//         ),
//       ):const Center(child: CircularProgressIndicator());},
//     );
//   }
// }
