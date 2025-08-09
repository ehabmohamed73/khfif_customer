import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khafif/core/constants/app_rootd.dart';

class PriceCalcController extends GetxController {
  List<String> cities = [
    'صنعاء',
    'عدن',
    'الحديدة',
    'تعز',
    'حضرموت',
    'إب',
    'ذمار',
    'شبوة',
    'المكلا',
    'المهرة',
    'مارب',
    'عمران',
    'صعدة',
    'لحج',
    'الضالع',
    'حجة',
  ];

  String? fromCity;
  String? toCity;

  void setFromCity(String? city) {
    fromCity = city;
    update();
  }

  void setToCity(String? city) {
    toCity = city;
    update();
  }

  void goTONextscren() {
    print("====== من====== $fromCity ========== $toCity ==============");
    Get.toNamed(AppRoot.priceTypeCalcScreen);
    // Handle the next button action
    Get.snackbar("Next", "Proceeding to the next step");
  }

  // حساب الوزن ونوع الطرد
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

  void changeThePlaces() {
    Get.offNamed(AppRoot.priceCalc);
  }

  void goToLastScreen() {
    print(
      "==== $shipmentType  === $weightUnit  ==== ${weightController.text} =====",
    );
    Get.toNamed(AppRoot.priceCalcShowScreen);
    // Handle the next button action
  }
}
