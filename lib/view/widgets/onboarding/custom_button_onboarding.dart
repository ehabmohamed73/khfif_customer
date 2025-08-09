import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khafif/controller/onboarding_controller.dart';
import 'package:khafif/core/constants/appColors.dart';

class CustomButtonOnBording extends GetView<OnBordingControllerImp> {
  const CustomButtonOnBording({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
      height: 70,
      margin: const EdgeInsets.only(bottom: 30),
      child: MaterialButton(
        onPressed: () {
          controller.next();
        },
        textColor: Colors.white,
        color: AppColor.primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 0),
        child: Text(
          "التالي",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
