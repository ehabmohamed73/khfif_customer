import 'package:get/get.dart';
import 'package:khafif/core/constants/app_rootd.dart';

/// Controller to handle startup logic and navigation
class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    _loadAndNavigate();
  }

  Future<void> _loadAndNavigate() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offAllNamed(AppRoot.appOnBoardingScreen);
  }
}
