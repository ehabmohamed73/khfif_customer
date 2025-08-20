import 'package:get/get.dart';
import 'package:khafif/core/services/inti_services.dart';
import 'package:khafif/data/datasource/static/static.dart';
import 'package:khafif/data/models/address_model.dart';

class ConfirmController extends GetxController {
  MyServices services = Get.find<MyServices>();
  AddressModel addressModel = AddressModel();
  DateTime now = DateTime.now();
  String monthName = '';
  String reciveDate = '';
  String reciveWeekday = '';
  String fromTime = '';
  String toTime = '';
  String city = '';
  String fromCity = "";
  var arguments = Get.arguments;
  String? shipmentType = '';
  String? weightUnit = '';
  String? weightValue = '';
  String totalPrice = '';
  @override
  void onInit() {
    totalPrice = "1000";
    fromTime = services.sharedpref.getString("fromTime") ?? '';
    toTime = services.sharedpref.getString("toTime") ?? '';
    monthName = months[now.month - 1];
    reciveDate = services.sharedpref.getString("reciveDate") ?? '';
    reciveWeekday = services.sharedpref.getString("reciveWeekday") ?? '';
    shipmentType = arguments["shipmentType"];
    weightUnit = arguments["weightUnit"];
    weightValue = arguments["weightValue"];
    city = services.sharedpref.getString("city") ?? '';
    super.onInit();
  }
}
