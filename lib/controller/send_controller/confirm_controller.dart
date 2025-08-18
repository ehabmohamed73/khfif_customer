import 'package:get/get.dart';
import 'package:khafif/core/services/inti_services.dart';

class ConfirmController extends GetxController {
  MyServices services = Get.find<MyServices>();
  String city = '';
  String fromCity="";
  var arguments=Get.arguments;
  String? shipmentType='';
  String? weightUnit='';
  String? weightValue='';
  @override
  void onInit() {
    shipmentType=arguments["shipmentType"];
    weightUnit=arguments["weightUnit"];
    weightValue=arguments["weightValue"];
    city = services.sharedpref.getString("city") ?? '';
    super.onInit();
  }
}
