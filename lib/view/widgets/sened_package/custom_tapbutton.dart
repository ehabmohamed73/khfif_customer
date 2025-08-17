// Tab Button Custom Widget
import 'package:flutter/material.dart';
import 'package:khafif/controller/send_controller/reciver_controller.dart';
import 'package:khafif/core/constants/appColors.dart';

class CustomTapbutton extends StatelessWidget {
  final int index;
  final IconData icon;
  final String label;
  final ReciverController controller;

  const CustomTapbutton({
    super.key,
    required this.index,
    required this.icon,
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = controller.selectedTab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          controller.selectedTab = index;
          controller.update();
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? AppColor.primaryColor : Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: AppColor.primaryColor.withOpacity(0.3),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ]
                : [],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: isSelected ? Colors.white : AppColor.primaryColor,
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? Colors.white : AppColor.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
