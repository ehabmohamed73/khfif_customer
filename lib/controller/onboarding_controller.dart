import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khafif/core/constants/app_rootd.dart';
import 'package:khafif/core/services/inti_services.dart';
import 'package:khafif/data/datasource/static/static.dart';

abstract class OnBordingController extends GetxController {
  next();
  onPageChanged(int index);
}

class OnBordingControllerImp extends OnBordingController {
  int currentPage = 0;
  late PageController pageController;
  MyServices myservices = Get.find();
  @override
  next() {
    currentPage++;
    if (currentPage >= bordingModleList.length) {
      Get.offAllNamed(AppRoot.appLoginScreen);
      myservices.sharedpref.setString('step', "1");
    } else {
      pageController.animateToPage(
        currentPage,
        duration: const Duration(microseconds: 900),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
