import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmAndCheckout extends StatelessWidget {
  ConfirmAndCheckout({super.key});
  final args = Get.arguments;

  @override
  Widget build(BuildContext context) {
    String title = args["shipmentType"];
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Container(),
    );
  }
}
