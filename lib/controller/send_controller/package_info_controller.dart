import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khafif/core/constants/app_rootd.dart';

class PackageInfoController extends GetxController {
  String shipmentType = 'وثيقة';
  String weightUnit = 'كجم';
  TextEditingController weightController = TextEditingController();

  void setShipmentType(String type) {
    shipmentType = type;
    update();
  }

  void setWeightUnit(String? unit) {
    if (unit != null) {
      weightUnit = unit;
      update();
    }
  }

  void goToPriceAndCheckOutScreen() {
    print(
      "==== $shipmentType  === $weightUnit  ==== ${weightController.text} =====",
    );
    Get.toNamed(
      AppRoot.confirmAndCheckout,
      arguments: {
        "shipmentType": shipmentType,
        "weightUnit": weightUnit,
        "weightValue": weightController.text,
      },
    );

    // Handle the next button action
  }
}
