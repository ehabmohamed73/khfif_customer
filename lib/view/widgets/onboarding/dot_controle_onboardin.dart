import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khafif/controller/onboarding_controller.dart';
import 'package:khafif/core/constants/appColors.dart';
import 'package:khafif/data/datasource/static/static.dart';

class dotControllerOnBording extends StatelessWidget {
  const dotControllerOnBording({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBordingControllerImp>(
      builder: ((controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
            bordingModleList.length,
            (index) => AnimatedContainer(
              margin: const EdgeInsets.only(right: 5),
              duration: const Duration(milliseconds: 900),
              width: controller.currentPage == index ? 20 : 6,
              height: 6,
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
