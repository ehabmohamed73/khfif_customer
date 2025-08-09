import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khafif/controller/navbar_controller.dart';
import 'package:khafif/core/constants/appColors.dart';

class CustomBottomNavBar extends StatelessWidget {
  final NavController controller = Get.find();

  CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        elevation: 8,
        selectedItemColor: AppColor.primaryColor,
        unselectedItemColor: Colors.grey,
        backgroundColor: const Color(0xFFF5F1F1),
        currentIndex: controller.currentIndex.value,
        onTap: controller.changeTabIndex,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ' الرئيسية'),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_shipping),
            label: 'شحناتي',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.move_to_inbox),
            label: 'إرسال',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: ' الاسعر',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'حسابي '),
        ],
      ),
    );
  }
}
