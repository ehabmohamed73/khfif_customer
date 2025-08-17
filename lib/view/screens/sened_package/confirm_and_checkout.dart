import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khafif/controller/send_controller/confirm_controller.dart';
import 'package:khafif/view/widgets/calculator/custom_header_calc.dart';

// ignore: must_be_immutable
class ConfirmAndCheckout extends StatelessWidget {
  ConfirmAndCheckout({super.key});
  ConfirmController confirmController = Get.put(ConfirmController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeaderCalc(title: "معلومات الشحنة"),
      body: Container(
        child: Text(
          "المدينة: ${confirmController.city}",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
