import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khafif/core/constants/app_rootd.dart';
import 'package:khafif/core/services/inti_services.dart';

class ForgetPasswordController extends GetxController {
  MyServices services = Get.find();
  late TextEditingController phoneController;
  
  @override
  void onClose() {
    phoneController.dispose();
    
    super.onClose();
  }

 
  void goToLogin() {
    Get.toNamed(AppRoot.appLoginScreen);
  }

  @override
  void onInit() {
    print(services.sharedpref.getString("step"));
    phoneController = TextEditingController();
    super.onInit();
  }
}
