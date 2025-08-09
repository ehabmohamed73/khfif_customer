import 'package:get/get.dart';
import 'package:flutter/material.dart';

class EditInfoController extends GetxController {
  // نحتاج فقط للتحكم بالنصوص الآن
  late TextEditingController phoneCtrl;
  late TextEditingController emailCtrl;
  late TextEditingController nameCtrl;

  @override
  void onInit() {
    super.onInit();
    phoneCtrl = TextEditingController(text: '739711876');
    emailCtrl = TextEditingController(text: 'EHAB@khafif.com');
  }

  @override
  void onClose() {
    phoneCtrl.dispose();
    emailCtrl.dispose();

    super.onClose();
  }

  void save() {
    final fullPhone = '+967 ${phoneCtrl.text}';
    print('Saving → phone: $fullPhone, email: ${emailCtrl.text}');
    // TODO: أرسل البيانات للخادم أو خزّنها محليًا
  }
}
