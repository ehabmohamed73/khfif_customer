import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khafif/core/constants/app_rootd.dart';

class PackageInfoController extends GetxController {
  String shipmentType = 'وثيقة';
  String weightUnit = 'كجم';
  TextEditingController weightController = TextEditingController();
  TextEditingController shipmentDescriptionController = TextEditingController();
  TextEditingController shipmentPrice = TextEditingController();
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
      "==== $shipmentType  === $weightUnit  ==== ${weightController.text} ===== ${shipmentDescriptionController.text}=== ${shipmentPrice.text}",
    );
    Get.toNamed(
      AppRoot.confirmAndCheckout,
      arguments: {
        "shipmentType": shipmentType,
        "weightUnit": weightUnit,
        "weightValue": weightController.text,
        "shipmentDescription": shipmentDescriptionController.text,
        "shipmentPrice": shipmentPrice.text,
      },
    );

    // Handle the next button action
  }
}
