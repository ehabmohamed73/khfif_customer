import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:khafif/core/constants/app_rootd.dart';
import 'package:khafif/core/services/inti_services.dart';

class ReciverController extends GetxController
    with SingleGetTickerProviderMixin {
  late TextEditingController cityController;
  late TextEditingController streetController;
  late TextEditingController descriptionController;
  late TextEditingController reciverNameController;
  late TextEditingController reciverPhoneController;
  var rememberMe = false;
  String? toCity;
  int selectedTab = 0; // بدون .obs
  late TabController tabController;
  MyServices services = Get.find<MyServices>();

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
    services.sharedpref.setString("city", toCity!);
    Get.toNamed(AppRoot.packageInfo);
  }

  void changeTab(int index) {
    selectedTab = index;
    update(); // هذا مهم جداً
  }

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
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
    tabController.dispose();
    super.onClose();
  }
}
