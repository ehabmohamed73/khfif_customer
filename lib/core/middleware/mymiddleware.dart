import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khafif/core/constants/app_rootd.dart';
import 'package:khafif/core/services/inti_services.dart';

class MyMiddleWare extends GetMiddleware {
  int? get Priority => 1;
  MyServices myServices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedpref.getString('step') == '1') {
      return const RouteSettings(name: AppRoot.appLoginScreen);
    }
    if (myServices.sharedpref.getString('step') == '2') {
      return const RouteSettings(name: AppRoot.appHomeScreen);
    }
    return null;
  }
}
