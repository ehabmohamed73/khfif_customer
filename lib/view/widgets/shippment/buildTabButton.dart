import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khafif/controller/shippment_controller.dart';
import 'package:khafif/core/constants/appColors.dart';

Widget BuildTabButton(String title, int index) {
  final ShipmentsController controller = Get.find();
  return Obx(() {
    final isSelected = controller.selectedTab.value == index;
    return GestureDetector(
      onTap: () => controller.switchTab(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.primaryColor : const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Icon(
              index == 0 ? Icons.download : Icons.upload,
              color: isSelected ? Colors.white : Colors.black54,
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  });
}
