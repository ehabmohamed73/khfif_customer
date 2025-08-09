import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khafif/controller/onboarding_controller.dart';
import 'package:khafif/core/constants/appColors.dart';
import 'package:khafif/data/datasource/static/static.dart';

class CustomSliderOnBordng extends GetView<OnBordingControllerImp> {
  const CustomSliderOnBordng({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: (value) => controller.onPageChanged(value),
      controller: controller.pageController,
      itemCount: bordingModleList.length,
      itemBuilder: (context, i) => Column(
        children: [
          const SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              bordingModleList[i].image!,
              width: 300,
              height: Get.width / 1.3,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(height: 40),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Text(
              bordingModleList[i].title!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: AppColor.black,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              bordingModleList[i].body!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                height: 2,
                color: AppColor.gray,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
