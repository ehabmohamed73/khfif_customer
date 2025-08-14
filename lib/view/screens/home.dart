import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khafif/controller/navbar_controller.dart';
import 'package:khafif/core/functions/alert_exite.dart';
import 'package:khafif/view/screens/home_page.dart';
import 'package:khafif/view/screens/price_calculator/price_calc.dart';
import 'package:khafif/view/screens/profile.dart';
import 'package:khafif/view/screens/sened_package/sened_package.dart';
import 'package:khafif/view/screens/shipment_page.dart';
import 'package:khafif/view/widgets/Home/custome_navbar.dart';

class Home extends StatelessWidget {
  final List<Widget> pages = [
    HomePage(),
    ShipmentsPage(),
    SenedPackage(),
    PriceCalc(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    final NavController controller = Get.put(NavController());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: WillPopScope(
          onWillPop: AlertExitApp,
          child: Obx(() => pages[controller.currentIndex.value]),
        ),
        bottomNavigationBar: CustomBottomNavBar(),
      ),
    );
  }
}
