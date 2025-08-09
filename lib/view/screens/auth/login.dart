import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khafif/controller/login_controoler.dart';
import 'package:khafif/core/constants/appColors.dart';
import 'package:khafif/core/constants/app_rootd.dart';
import 'package:khafif/core/constants/image_assets.dart';
import 'package:khafif/core/functions/alert_exite.dart';
import 'package:khafif/view/widgets/auth/coustomAuthButton.dart';
import 'package:khafif/view/widgets/auth/coustomAuthNav.dart';
import 'package:khafif/view/widgets/auth/coustom_TextForm_Outh.dart';
import 'package:khafif/view/widgets/auth/logoAuth.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
  Login({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(LoginControoler());
    return Scaffold(
      body: WillPopScope(
        onWillPop: AlertExitApp,
        child: Container(
          padding: const EdgeInsets.all(15),
          child: GetBuilder<LoginControoler>(
            builder: (controller) {
              return ListView(
                children: [
                  const SizedBox(height: 20),
                  const LogoAuth(),
                  const SizedBox(height: 20),
                  Text(
                    'تسجيل الدخول',
                    textAlign: TextAlign.center,
                    style: Theme.of(
                      context,
                    ).textTheme.displayLarge!.copyWith(color: Colors.black),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'ادخل رقم الهاتف وكلمة المرور الخاصة بك لتسجيل الدخول',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  const SizedBox(height: 40),
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
                  const SizedBox(height: 20),
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
                        Icon(Icons.visibility, color: AppColor.gray, size: 26),
                        const SizedBox(width: 12),
                        Expanded(
                          child: CoustomTextFormOuth(
                            validFiled: (val) {
                              return null;
                            },
                            textLable: 'الباسورد',
                            textHint: 'ادخل كلمة المرور',
                            myController: controller.passwordController,
                            isObscureText: true,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          controller.goToForgetPassword();
                        },
                        child: const Text('نسيت كلمة المرور؟'),
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: controller.rememberMe,
                            onChanged: (value) {
                              controller.toggleRememberMe();
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: const Text('تذكرني'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  CoustomAuthButton(
                    text: 'تسجيل الدخول',
                    onPressed: () {
                      Get.toNamed(AppRoot.otpScreen);
                    },
                  ),
                  CustomAuthNav(
                    text2: ' انشاء حساب',
                    text1: ' ليس لديك حساب؟',
                    onTap: () {
                      controller.goToSignUp();
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
