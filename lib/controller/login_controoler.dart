import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khafif/core/constants/app_rootd.dart';
import 'package:khafif/core/services/inti_services.dart';

class LoginControoler extends GetxController {
  MyServices services = Get.find();
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  var rememberMe = false;
  @override
  void onClose() {
    phoneController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void toggleRememberMe() {
    rememberMe = !rememberMe;
    update();
  }

  void goToSignUp() {
    Get.toNamed(AppRoot.appRegisterScreen);
  }
void goToForgetPassword() {
    Get.toNamed(AppRoot.appForgetPasswordScreen);
  }
  @override
  void onInit() {
    print(services.sharedpref.getString("step"));
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }
}
