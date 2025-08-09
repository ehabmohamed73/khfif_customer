import 'package:flutter/material.dart';
import 'package:khafif/core/constants/appColors.dart';

class CustomHeaderCalc extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomHeaderCalc({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(80); // <-- مهم

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      child: AppBar(
        title: Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColor.thirdColor,
        centerTitle: true,
        elevation: 0,
      ),
    );
  }
}
