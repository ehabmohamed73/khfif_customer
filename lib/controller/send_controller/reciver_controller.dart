import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:khafif/core/constants/app_rootd.dart';

class ReciverController extends GetxController {
  late TextEditingController cityController;
  late TextEditingController streetController;
  late TextEditingController descriptionController;
  late TextEditingController reciverNameController;
  late TextEditingController reciverPhoneController;
  var rememberMe = false;
  String? toCity;
  List<String> cities = [
    'صنعاء',
    'عدن',
    'الحديدة',
    'تعز',
    'حضرموت',
    'إب',
    'ذمار',
    'شبوة',
    'المكلا',
    'المهرة',
    'مارب',
    'عمران',
    'صعدة',
    'لحج',
    'الضالع',
    'حجة',
  ];
  void toggleRememberMe() {
    rememberMe = !rememberMe;
    update();
  }

  void setToCity(String? city) {
    toCity = city;
    update();
  }

  goToPackageInfo() {
    Get.toNamed(AppRoot.packageInfo);
  }

  @override
  void onInit() {
    cityController = TextEditingController();
    streetController = TextEditingController();
    descriptionController = TextEditingController();
    reciverNameController = TextEditingController();
    reciverPhoneController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    cityController.dispose();
    streetController.dispose();
    descriptionController.dispose();
    reciverNameController.dispose();
    reciverPhoneController.dispose();
    super.onClose();
  }
}
