import 'dart:async';
import 'package:get/get.dart';
import 'package:khafif/core/constants/app_rootd.dart';
import 'package:khafif/core/services/inti_services.dart';

class OtpController extends GetxController {
  MyServices myServices = Get.find();
  Timer? _timer;
  var seconds = 45.obs; // Make seconds observable

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  void startTimer() {
    _timer?.cancel(); // cancel previous timer if exists
    seconds.value = 45;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds.value > 0) {
        seconds.value--;
        // Notify listeners about the change
      } else {
        _timer?.cancel();
      }
    });
  }

  verificationCode() {
    Get.offAllNamed(AppRoot.appHomeScreen);
    myServices.sharedpref.setString("step", "2");
    // Navigate to home screen after OTP verification
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
