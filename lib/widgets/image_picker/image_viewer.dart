import 'dart:io';
import 'package:flutter/material.dart';

class ImageViewer extends StatelessWidget {
  const ImageViewer({super.key, required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(child: url.contains('http') ?
    Image.network(url) : Image.file(File(url)));
  }
}
