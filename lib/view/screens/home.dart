// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class Home extends StatelessWidget {
//   const Home({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       theme: ThemeData.dark().copyWith(
//         scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
//       ),
//       home: const Scaffold(
//         body: Center(child: Text("محتوى الصفحة هنا")),
//         bottomNavigationBar: CustomBottomBar(),
//       ),
//     );
//   }
// }

// class BottomBarController extends GetxController {
//   RxInt selectedIndex = 0.obs;

//   void select(int index) {
//     selectedIndex.value = index;
//   }
// }

// class CustomBottomBar extends StatelessWidget {
//   const CustomBottomBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final BottomBarController controller = Get.put(BottomBarController());

//     return Obx(
//       () => Container(
//         height: 80,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: const BorderRadius.only(
//             topLeft: Radius.circular(12),
//             topRight: Radius.circular(12),
//           ),
//           boxShadow: const [
//             BoxShadow(
//               color: Color(0x330D0A2C),
//               blurRadius: 20,
//               offset: Offset(0, 6),
//             ),
//           ],
//         ),
//         child: Stack(
//           alignment: Alignment.center,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 iconItem(Icons.home, 0, controller),
//                 iconItem(Icons.chat, 1, controller),
//                 const SizedBox(width: 48), // فراغ للزر الأوسط
//                 iconItem(Icons.notifications, 2, controller),
//                 iconItem(Icons.person, 3, controller),
//               ],
//             ),

//             // زر "أعجبني"
//             Positioned(
//               top: -25,
//               child: Column(
//                 children: [
//                   GestureDetector(
//                     onTap: () => controller.select(4),
//                     child: Container(
//                       width: 50,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         color: controller.selectedIndex.value == 4
//                             ? Colors.green
//                             : Colors.grey.shade300,
//                         shape: BoxShape.circle,
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.1),
//                             blurRadius: 10,
//                             offset: const Offset(0, 5),
//                           ),
//                         ],
//                       ),
//                       child: Icon(
//                         Icons.thumb_up,
//                         color: controller.selectedIndex.value == 4
//                             ? Colors.white
//                             : Colors.green,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 5),
//                   Text(
//                     'أعجبني',
//                     style: TextStyle(
//                       color: controller.selectedIndex.value == 4
//                           ? Colors.green
//                           : Colors.grey,
//                       fontSize: 12,
//                       fontWeight: FontWeight.bold,
//                       fontFamily: 'Open Sans Hebrew',
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget iconItem(IconData icon, int index, BottomBarController controller) {
//     bool isSelected = controller.selectedIndex.value == index;
//     return GestureDetector(
//       onTap: () => controller.select(index),
//       child: Icon(icon, color: isSelected ? Colors.green : Colors.grey),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khafif/controller/navbar_controller.dart';
import 'package:khafif/core/functions/alert_exite.dart';
import 'package:khafif/view/screens/home_page.dart';
import 'package:khafif/view/screens/price_calc.dart';
import 'package:khafif/view/screens/profile.dart';
import 'package:khafif/view/screens/shipment_page.dart';
import 'package:khafif/view/widgets/Home/custome_navbar.dart';

class Home extends StatelessWidget {
  final List<Widget> pages = [
    HomePage(),
    ShipmentsPage(),
    Center(child: Text("إرسال")),
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
