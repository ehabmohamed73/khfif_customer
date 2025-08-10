import 'package:get/get.dart';

class ReciverController extends GetxController {
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

  void setToCity(String? city) {
    toCity = city;
    update();
  }
}
