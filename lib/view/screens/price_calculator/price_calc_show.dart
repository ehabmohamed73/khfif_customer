import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khafif/controller/price_calc_controller.dart';
import 'package:khafif/core/constants/appColors.dart';
import 'package:khafif/core/constants/image_assets.dart';
import 'package:khafif/view/widgets/calculator/custom_build_widget.dart';
import 'package:khafif/view/widgets/calculator/custom_header_calc.dart';
import 'package:khafif/view/widgets/calculator/custome_text.dart';

class PriceCalcShow extends StatelessWidget {
  const PriceCalcShow({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PriceCalcController());
    return Scaffold(
      appBar: CustomHeaderCalc(title: "معلومات الشحن و السعر "),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: GetBuilder<PriceCalcController>(
          builder: (controller) {
            return ListView(
              children: [
                // بطاقة المعلومات
                Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomBuildWidget(
                        imageUrl: imagesAssets.fromCityImage,
                        title: "المرسلة من",
                        value: controller.fromCity,
                      ),
                      CustomBuildWidget(
                        title: "المرسلة إلى",
                        value: controller.toCity,
                        imageUrl: imagesAssets.toCityImage,
                      ),
                      CustomBuildWidget(
                        title: "ماذا تريد أن تشحن؟",
                        value:
                            "${controller.weightController.text} كجم، ${controller.shipmentType}",
                        imageUrl: imagesAssets.shipmentImage,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),
                // ملاحظة السعر
                CustomeTextRow(),
                const SizedBox(height: 16),
                // بطاقة السعر
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: AppColor.primaryColor, width: 3),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Image.asset(imagesAssets.trackImage, height: 150),

                      Text(
                        "${controller.shipmentType},تسلم في التاريخ والوقت المحدد",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "110 ريال يمني",
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text("تسلم يوم ", style: const TextStyle(fontSize: 14)),
                    ],
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'تمتع بأفضل الخدمات مع خفيف',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFFFF0004),
                    fontSize: 16,

                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'أرسل شحنتك مباشرة من باب منزلك',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF0D1217),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
