import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khafif/core/constants/app_rootd.dart';

import '../../controller/splashScreen_controller.dart' ;


/// Splash screen as a StatelessWidget
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Instantiate the controller (only once)
    Get.put(SplashController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppRoot.appLogo, width: 120),
            const SizedBox(height: 20),
            const Text(
              'Welcome to Khafif',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}



// class splashScreen extends StatelessWidget {
//   const splashScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Replace with your app logo
//             Image.asset(AppRoot.appLogo, width: 120),
//             SizedBox(height: 20),
//             Text(
//               'Welcome to Khafif',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
