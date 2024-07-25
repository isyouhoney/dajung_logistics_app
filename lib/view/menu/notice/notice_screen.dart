// import 'package:allpark24/controller/notice_controller.dart';
// import 'package:allpark24/widgets/faq_item.dart';
// import 'package:allpark24/screens/menu/notice/notice_item.dart';
// import 'package:flutter/material.dart';
//
// class NoticeScreen extends StatefulWidget {
//   const NoticeScreen({required this.noticeType, super.key});
//
//   final String noticeType;
//
//   @override
//   State<NoticeScreen> createState() => _NoticeScreenState();
// }
//
// class _NoticeScreenState extends State<NoticeScreen> {
//   int initialTabIndex = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     NoticeController.to.fetchNotices();
//     if (widget.noticeType.toLowerCase() == "faq") {
//       initialTabIndex = 1;
//     } else {
//       initialTabIndex = 0;
//     }
//
//     _scrollController = ScrollController();
//     // _scrollController.addListener(_onScroll);
//     // _fetchMoreData();
//   }
//
//   // final List<Notice> notices = [];
//   final int fetchThreshold = 10; // 한 번에 가져올 아이템 수
//   bool isLoading = false;
//   bool hasMoreData = true; // 추가된 상태
//
//   late ScrollController _scrollController;
//
//   // void _fetchMoreData() {
//   //   if (isLoading) return;
//   //   setState(() => isLoading = true);
//   //
//   //   // 가상 데이터 추가 로직
//   //   Future.delayed(const Duration(seconds: 2), () {
//   //     setState(() {
//   //       var newRecords = List.generate(fetchThreshold,
//   //           (index) => Notice(title: "공지사항 제목입니다", id: index + notices.length));
//   //       if (newRecords.isEmpty) {
//   //         hasMoreData = false; // 더 이상 로드할 데이터가 없음
//   //       } else {
//   //         notices.addAll(newRecords);
//   //       }
//   //       isLoading = false;
//   //     });
//   //   });
//   // }
//
//   // void _onScroll() {
//   //   if (_scrollController.position.pixels ==
//   //       _scrollController.position.maxScrollExtent) {
//   //     _fetchMoreData();
//   //   }
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       initialIndex: initialTabIndex,
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           foregroundColor: Colors.black,
//           title: const Text("고객센터"),
//           bottom: const TabBar(
//             labelColor: Colors.black,
//             unselectedLabelColor: Colors.grey,
//             indicatorColor: Color(0xff0B318F),
//             tabs: [
//               Tab(
//                 text: "공지사항",
//               ),
//               Tab(
//                 text: "FAQ",
//               ),
//             ],
//           ),
//         ),
//         body: TabBarView(children: [
//           FutureBuilder<void>(
//             future: NoticeController.to.fetchNotices(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(child: CircularProgressIndicator());
//               } else if (snapshot.hasError) {
//                 return const Center(child: Text("오류가 발생했습니다."));
//               }
//               return NoticeController.to.noticeList.isNotEmpty
//                   ? SingleChildScrollView(
//                           child: ListView.builder(
//                             shrinkWrap: true,
//                             physics: const NeverScrollableScrollPhysics(),
//                             controller: _scrollController,
//                             itemCount: NoticeController.to.noticeList.length,
//                             itemBuilder: (context, index) {
//                               return NoticeItemWidget(
//                                 notice: NoticeController.to.noticeList[index],
//                               );
//                             },
//                           ),
//                         )
//                   : const Center(
//                       child: Text(
//                         '공지사항이 없습니다',
//                         style: TextStyle(fontSize: 16, color: Colors.grey),
//                       ),
//                     );
//             },
//           ),
//           FutureBuilder<void>(
//             future: NoticeController.to.fetchFAQ(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(child: CircularProgressIndicator());
//               } else if (snapshot.hasError) {
//                 return const Center(child: Text("오류가 발생했습니다."));
//               }
//               return NoticeController.to.faqList.isNotEmpty
//                   ? SingleChildScrollView(
//                       child: ListView.builder(
//                         shrinkWrap: true,
//                         physics: const NeverScrollableScrollPhysics(),
//                         padding: EdgeInsets.zero,
//                         controller: _scrollController,
//                         itemCount: NoticeController.to.faqList.length,
//                         itemBuilder: (context, index) {
//                           return FAQItem(
//                               faq: NoticeController.to.faqList[index]);
//                         },
//                       ),
//                     )
//                   : const Center(
//                       child: Text(
//                         '등록된 FAQ가 없습니다',
//                         style: TextStyle(fontSize: 16, color: Colors.grey),
//                       ),
//                     );
//             },
//           ),
//         ]),
//       ),
//     );
//   }
// }
