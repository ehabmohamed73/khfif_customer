import 'package:flutter/material.dart';
import 'package:khafif/core/constants/appColors.dart';

class CustomAuthNav extends StatelessWidget {
  final String text1, text2;
  final void Function() onTap;
  const CustomAuthNav({
    super.key,
    required this.text1,
    required this.text2,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: onTap,
          child: Text(
            text2,
            style: const TextStyle(
              color: AppColor.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(text1),
      ],
    );
  }
}
