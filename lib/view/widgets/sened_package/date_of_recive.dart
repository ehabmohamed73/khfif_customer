import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:khafif/controller/sened_package_controller.dart';

class DateOfRecive extends GetView<SenedPackageController> {
  final Color bgColor;
  final int index;
  final Color txtColor;
  const DateOfRecive(this.bgColor, this.index, this.txtColor, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      margin: EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            controller.dates[index],
            style: TextStyle(color: txtColor, fontWeight: FontWeight.bold),
          ),
          Text(
            controller.weekdays[index],
            style: TextStyle(color: txtColor, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
