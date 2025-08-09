import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khafif/controller/onboarding_controller.dart';
import 'package:khafif/view/widgets/onboarding/custom_button_onboarding.dart';
import 'package:khafif/view/widgets/onboarding/custom_slider_onboarding.dart';
import 'package:khafif/view/widgets/onboarding/dot_controle_onboardin.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBordingControllerImp());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(flex: 3, child: CustomSliderOnBordng()),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    dotControllerOnBording(),
                    Spacer(),
                    CustomButtonOnBording(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
