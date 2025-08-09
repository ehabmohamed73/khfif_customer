import 'package:flutter/material.dart';
import 'package:khafif/core/constants/appColors.dart';

class CustomCalcHeader2 extends StatelessWidget {
  final String title;
  const CustomCalcHeader2({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.calculate, color: AppColor.primaryColor, size: 40),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "الحصول على سعر شحنتي",
                style: TextStyle(
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(title, style: TextStyle(fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}
