import 'package:get/get.dart';
import 'package:khafif/core/classes/curd.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => loin(), fenix: true);
    Get.put(Crud());
  }
}
