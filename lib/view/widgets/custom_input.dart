import 'package:flutter/material.dart';
import 'package:khafif/core/constants/appColors.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    super.key,
    required this.textEditingController,
    required this.textHint,
    this.icon,
  });
  final TextEditingController textEditingController;
  final String textHint;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColor.black),
      ),
      child: Row(
        children: [
          // علم اليمن ثابت
          Icon(icon, color: Colors.grey, size: 20),
          const SizedBox(width: 8),
          const SizedBox(width: 12),
          Expanded(
            child: TextFormField(
              controller: textEditingController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'رقم الجوال',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
