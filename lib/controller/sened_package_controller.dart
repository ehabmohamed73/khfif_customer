import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SenedPackageController extends GetxController {
  int selectedDateIndex = 0;
  TimeOfDay fromTime = TimeOfDay(hour: 9, minute: 30);
  TimeOfDay toTime = TimeOfDay(hour: 12, minute: 30);

  final List<String> dates = ['03', '04', '05', '06', '07'];
  final List<String> weekdays = [
    'الأحد',
    'الإثنين',
    'الثلاثاء',
    'الأربعاء',
    'الخميس',
  ];

  void selectDate(int index) {
    selectedDateIndex = index;
    update();
  }

  void setFromTime(TimeOfDay time) {
    fromTime = time;
    update();
  }

  void setToTime(TimeOfDay time) {
    toTime = time;
    update();
  }
}
