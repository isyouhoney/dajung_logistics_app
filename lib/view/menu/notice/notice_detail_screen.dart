import 'package:bakery_app/models/notice.dart';
import 'package:bakery_app/widgets/default_layout.dart';
import 'package:flutter/material.dart';

class NoticeDetailScreen extends StatelessWidget {
  const NoticeDetailScreen({super.key, required this.notice});
  final Notice notice;

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(title: notice.title,
        child: SingleChildScrollView(
          child: Padding(padding: const EdgeInsets.fromLTRB(20,20,20,20),
                  child: //snapshot.data.content.contains('https://') ? Image.network(snapshot.data.content):
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(notice.content, style: const TextStyle(fontSize: 16, height: 1.5),),
                  ))

        )
    );}}

