import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khafif/core/constants/appColors.dart';

// ignore: non_constant_identifier_names
Future<bool> AlertExitApp() {
  Get.defaultDialog(
    backgroundColor: AppColor.backgroundColor,
    title: "تنبية",
    middleText: "هل تريد الخروج من التطبيق؟",
    actions: [
      ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: AppColor.gray2),
        onPressed: () {
          exit(0);
        },
        child: const Text('نعم', style: TextStyle(color: Colors.white)),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: AppColor.secoundColor),
        onPressed: () {
          Get.back();
        },
        child: const Text('لا', style: TextStyle(color: Colors.white)),
      ),
    ],
  );
  return Future.value(true);
}
