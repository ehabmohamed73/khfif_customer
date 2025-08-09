import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khafif/controller/otp_controller.dart';
import 'package:khafif/core/constants/appColors.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:khafif/view/widgets/auth/coustomAuthTitle.dart';

class Otp extends StatelessWidget {
  const Otp({super.key});

  @override
  Widget build(BuildContext context) {
    OtpController otpController = Get.put(
      OtpController(),
    ); // Initialize OtpController
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: AppColor.backgroundColor),
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 50),
        child: ListView(
          children: [
            const SizedBox(height: 10),
            // const logoAuth(),

            // ✅ العنوان وزر الرجوع بمحاذاة واحدة
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // ✅ لازم لون حتى يظهر الظل
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 50),
                const CustomAuthTitle(text: 'رمز التحقق'),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              'ادخل رمز التحقق المرسل الى رقم هاتفك',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              '+967 777 777 777',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall,
            ),

            const SizedBox(height: 50),
            OtpTextField(
              borderRadius: BorderRadius.circular(10),

              numberOfFields: 5,
              borderColor: AppColor.primaryColor,
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {}, // end onSubmit
            ),
            const SizedBox(height: 30),
            // 🔁 المؤقت وزر الإرسال
            GetBuilder(
              builder: (OtpController controller) {
                return Column(
                  children: [
                    const Text('لم تستلم الرمز؟'),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.timer, size: 18),
                        const SizedBox(width: 5),
                        Text(
                          '00:${controller.toString().padLeft(2, '0')}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: controller.seconds == 0
                          ? () {
                              controller.startTimer();
                              // 🟡 هنا تقدر ترسل طلب "إعادة إرسال" إلى الباك
                            }
                          : null,
                      child: Text(
                        'إعادة إرسال الرمز',
                        style: TextStyle(
                          color: controller.seconds == 0
                              ? AppColor.primaryColor
                              : Colors.grey,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to home screen
                otpController.verificationCode();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primaryColor,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text('تأكيد'),
            ),
          ],
        ),
      ),
    );
  }
}
