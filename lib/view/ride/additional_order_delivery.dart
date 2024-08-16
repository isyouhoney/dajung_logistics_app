import 'package:bakery_app/widgets/default_layout.dart';
import 'package:flutter/material.dart';

class AdditionalOrderDelivery extends StatefulWidget {
  const AdditionalOrderDelivery({super.key});

  @override
  State<AdditionalOrderDelivery> createState() => _AdditionalOrderDeliveryState();
}

class _AdditionalOrderDeliveryState extends State<AdditionalOrderDelivery> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(title: '일일 배송', child: SingleChildScrollView(child: Column(children: [

    ],),));
  }
}
