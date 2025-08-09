import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khafif/controller/forget_password_controller.dart';
import 'package:khafif/core/constants/appColors.dart';
import 'package:khafif/core/constants/app_rootd.dart';
import 'package:khafif/core/constants/image_assets.dart';
import 'package:khafif/core/functions/alert_exite.dart';
import 'package:khafif/view/widgets/auth/coustomAuthButton.dart';
import 'package:khafif/view/widgets/auth/coustom_TextForm_Outh.dart';
import 'package:khafif/view/widgets/auth/logoAuth.dart';
class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordController());
    return Scaffold(
      // ignore: deprecated_member_use
      body: WillPopScope(
        onWillPop: AlertExitApp,
        child: Container(
          padding: const EdgeInsets.all(15),
          child: GetBuilder<ForgetPasswordController>(
            builder: (controller) {
              return ListView(
                children: [
                  const SizedBox(height: 15),
                  const LogoAuth(),
                  SizedBox(height: 15),
                  Text(
                    'استعادة كلمة المرور',
                    textAlign: TextAlign.center,
                    style: Theme.of(
                      context,
                    ).textTheme.displayMedium!.copyWith(color: Colors.black),
                  ),
                  SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColor.black),
                    ),
                    child: Row(
                      children: [
                        Image.asset(imagesAssets.yemen, width: 24),
                        const SizedBox(width: 8),
                        const Text(
                          '+967',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: CoustomTextFormOuth(
                            validFiled: (val) {
                              return null;
                            },
                            textLable: 'الهاتف',
                            textHint: 'ادخل رقم هاتفك',
                            myController: controller.phoneController,
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  CoustomAuthButton(
                    text: ' استعادة كلمة المرور',
                    onPressed: () {
                      Get.toNamed(AppRoot.otpScreen);
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
