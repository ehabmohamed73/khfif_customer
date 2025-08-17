import 'package:get/get.dart';
import 'package:khafif/core/services/inti_services.dart';

class ConfirmController extends GetxController {
  MyServices services = Get.find<MyServices>();
  String city = '';
  @override
  void onInit() {
    city = services.sharedpref.getString("city") ?? '';
    super.onInit();
  }
}
