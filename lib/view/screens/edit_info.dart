import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khafif/controller/edit_info_controller.dart';
import 'package:khafif/core/constants/appColors.dart';
import 'package:khafif/core/constants/image_assets.dart';
import 'package:khafif/view/widgets/auth/coustomAuthButton.dart';
import 'package:khafif/view/widgets/auth/coustom_TextForm_Outh.dart';

class EditInfoPage extends StatelessWidget {
  EditInfoPage({super.key});
  final EditInfoController ctrl = Get.put(EditInfoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 50),
            const Text(
              'تغيير معلومات المستخدم',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),

            // الآن دولة واحدة فقط: اليمن
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
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
                            textLable: "رقم الهاتف",
                            myController: ctrl.phoneCtrl,

                            textHint: 'رقم الهاتف',
                            validFiled: (p0) {
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  // البريد الإلكتروني
                  const SizedBox(height: 16),
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
                        Icon(Icons.email, color: AppColor.gray, size: 26),
                        const SizedBox(width: 12),
                        Expanded(
                          child: CoustomTextFormOuth(
                            validFiled: (p0) {
                              return null;
                            },
                            textHint: "البريد الإلكتروني",
                            textLable: '',
                            myController: ctrl.emailCtrl,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),
                  // زر الحفظ
                  SizedBox(
                    width: double.infinity,
                    child: CoustomAuthButton(
                      text: "حفظ التغييرات",
                      onPressed: ctrl.save,
                    ),
                  ),
                  // SizedBox(
                  //   width: double.infinity,
                  //   child: ElevatedButton(
                  //     onPressed: ctrl.save,
                  //     style: ElevatedButton.styleFrom(
                  //       backgroundColor: AppColor.secoundColor,
                  //       padding: const EdgeInsets.symmetric(vertical: 14),
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(8),
                  //       ),
                  //     ),
                  //     child: const Text('حفظ التغييرات'),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
