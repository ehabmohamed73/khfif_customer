import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khafif/controller/send_controller/package_info_controller.dart';
import 'package:khafif/core/constants/appColors.dart';

class ChoseCar extends GetView<PackageInfoController> {
  final String text;
  final IconData icon;
  final int index; // رقم هذا الخيار

  const ChoseCar({
    super.key,
    required this.text,
    required this.icon,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          controller.setSelectedCarIndex(index); // يخزن الخيار المختار
        },
        child: GetBuilder<PackageInfoController>(
          builder: (_) => Container(
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: controller.selectedCarIndex == index
                    ? AppColor
                          .primaryColor // مميز إذا كان هو المختار
                    : AppColor.gray.withOpacity(0.5),
                width: 1,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 50, color: AppColor.gray),
                const SizedBox(height: 8),
                Text(
                  text,
                  style: TextStyle(fontSize: 14, color: AppColor.gray),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
