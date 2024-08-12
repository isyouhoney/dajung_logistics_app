import 'dart:io';
import 'package:bakery_app/view/menu/menu_drawer.dart';
import 'package:flutter/material.dart';

class DefaultLayout extends StatefulWidget {
  const DefaultLayout({super.key, required this.title, required this.child, this.bottomSheet, this.isPadded = true, this.appbarWidget});
  final dynamic title;
  final Widget child;
  final Widget? bottomSheet;
  final Widget? appbarWidget;
  final bool isPadded;

  @override
  State<DefaultLayout> createState() => _DefaultLayoutState();
}

class _DefaultLayoutState extends State<DefaultLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: widget.title.runtimeType == String?Text(widget.title):widget.title, actions: [widget.appbarWidget ?? const SizedBox()],),
    drawer: const MenuDrawer(),
    body: SafeArea(
      child: Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.isPadded?10:0),
      child: widget.child),
    ),
        bottomNavigationBar: BottomAppBar(
            elevation: 0,
            child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 16, vertical: Platform.isAndroid ? 10 : 0),
                child: widget.bottomSheet)));
  }
}
