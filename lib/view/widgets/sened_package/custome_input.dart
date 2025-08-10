import 'package:flutter/material.dart';
import 'package:khafif/core/constants/appColors.dart';

class CustomeInput extends StatelessWidget {
  final TextEditingController textEditingController;
  const CustomeInput({super.key, required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColor.gray2, // لون الخلفية مثل الصورة
        borderRadius: BorderRadius.circular(6),
      ),
      child: TextFormField(
        controller: textEditingController,
        textAlign: TextAlign.right, // الكتابة من اليمين
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        ),
      ),
    );
  }
}
