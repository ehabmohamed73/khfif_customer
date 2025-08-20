import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khafif/core/constants/app_rootd.dart';
import 'package:khafif/core/services/inti_services.dart';
import 'package:khafif/data/models/address_model.dart';

class SenedPackageController extends GetxController {
  int? selectedDateIndex;
  int? selectedLocation;
  TimeOfDay fromTime = TimeOfDay(hour: 9, minute: 30);
  TimeOfDay toTime = TimeOfDay(hour: 12, minute: 30);
  MyServices services = Get.find<MyServices>();
  final List<AddressModel> addressList = [
    AddressModel(
      mainAddress: "المنزل",
      addressName: "سكني",
      addressLink: "https://example.com/home.jpg",
      addressCity: "صنعاء",
    ),
    AddressModel(
      mainAddress: "المكتب",
      addressName: "عمل",
      addressLink: "https://example.com/office.jpg",
      addressCity: "عدن",
    ),
    AddressModel(
      mainAddress: "المستودع",
      addressName: "تخزين",
      addressLink: "https://example.com/warehouse.jpg",
      addressCity: "تعز",
    ),
  ];

  final List<String> dates = ['01', '02', '03', '04', '05', '06', '07'];
  final List<String> weekdays = [
    'الجمعة',
    'السبت',
    'الأحد',
    'الإثنين',
    'الثلاثاء',
    'الأربعاء',
    'الخميس',
  ];
  void reciveDate(int index) {
    services.sharedpref.setString("reciveDate", dates[index]);
    services.sharedpref.setString("reciveWeekday", weekdays[index]);
    services.sharedpref.setString(
      "fromTime",
      "${fromTime.hour}:${fromTime.minute}",
    );
    services.sharedpref.setString("toTime", "${toTime.hour}:${toTime.minute}");
    update();
  }

  void selectDate(int index) {
    selectedDateIndex = index;
    update();
  }

  void setselectedLocation(int index) {
    selectedLocation = index;
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

  void goTOReceiverInfo() {
    Get.toNamed(AppRoot.reciverInfo);
  }
}
