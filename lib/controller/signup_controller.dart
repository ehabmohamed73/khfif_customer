import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khafif/core/constants/app_rootd.dart';
import 'package:khafif/core/services/inti_services.dart';

class SignupController extends GetxController {
  MyServices services = Get.find();
  late TextEditingController phoneController;
  late TextEditingController nameController;
  late TextEditingController passwordController;
  var rememberMe = false;
  @override
  void onClose() {
    nameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void toggleRememberMe() {
    rememberMe = !rememberMe;
    update();
  }
  void goToLogin() {
    Get.toNamed(AppRoot.appLoginScreen);
  }
  @override
  void onInit() {
    print(services.sharedpref.getString("step"));
    nameController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }
}
