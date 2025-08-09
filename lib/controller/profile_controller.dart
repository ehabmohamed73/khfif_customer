import 'package:get/get.dart';
import 'package:khafif/core/constants/app_rootd.dart';
import 'package:khafif/core/services/inti_services.dart';

class ProfileController extends GetxController {
  var name = 'ايهاب محمد';
  var phone = '+967 739 711 876';
  var email = 'ehab@gmail.com';
  MyServices services = Get.find();
  void logout() {
    // هنا يمكنك إضافة منطق تسجيل الخروج
    print('Logging out...');
    Get.offAllNamed(
      AppRoot.appLoginScreen,
    ); // إعادة توجيه المستخدم إلى صفحة تسجيل الدخول
    services.sharedpref.setString("step", "1");
  }

  
}
