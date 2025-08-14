import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khafif/controller/send_controller/package_info_controller.dart';

void customPopUp() {
  final controller = Get.put(PackageInfoController());
  Get.dialog(
    AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      contentPadding: const EdgeInsets.all(20),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // زر الإغلاق
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () => Get.back(),
              child: const Icon(Icons.close, color: Colors.green),
            ),
          ),
          const SizedBox(height: 10),

          // العنوان
          const Text(
            "تقدير الوزن.",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),

          // النص
          const Text(
            "الرجاء التأكد من الوزن بعد التغليف لتجنب أي تأخر في التوصيل، "
            "قد يتغير السعر في حالة وجود اختلاف في الوزن",
            style: TextStyle(fontSize: 14, color: Colors.black54),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),

          // زر موافق
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.goToPriceAndCheckOutScreen(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text(
                "موافق",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    ),
    barrierDismissible: false,
  );
}
