import 'package:flutter/material.dart';
import 'package:khafif/core/constants/appColors.dart';

class EditeButton extends StatelessWidget {
  final VoidCallback onTap;
  const EditeButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 56, // يمكنك تعديل الأبعاد حسب التصميم
        height: 56,
        decoration: const BoxDecoration(
          color: AppColor.primaryColor, // لون الخلفية
          shape: BoxShape.circle,
        ),
        child: const Center(
          child: Icon(
            Icons.edit,
            color: AppColor.white, // لون الأيقونة
            size: 24, // حجم الأيقونة
          ),
        ),
      ),
    );
  }
}
