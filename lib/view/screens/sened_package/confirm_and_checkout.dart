import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khafif/controller/send_controller/confirm_controller.dart';
import 'package:khafif/core/constants/appColors.dart';
import 'package:khafif/core/constants/image_assets.dart';
import 'package:khafif/view/widgets/calculator/custom_build_widget.dart';
import 'package:khafif/view/widgets/calculator/custom_header_calc.dart';
import 'package:khafif/view/widgets/calculator/custome_text.dart';

// ignore: must_be_immutable
class ConfirmAndCheckout extends StatelessWidget {
  ConfirmAndCheckout({super.key});
  ConfirmController controller = Get.put(ConfirmController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeaderCalc(title: "معلومات الشحنة"),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
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
                    value: controller.city,
                    imageUrl: imagesAssets.toCityImage,
                  ),
                  CustomBuildWidget(
                    title: "ماذا تريد أن تشحن؟",
                    value:
                        "${controller.weightValue} كجم، ${controller.shipmentType}",
                    imageUrl: imagesAssets.shipmentImage,
                  ),
                  CustomBuildWidget(
                    title: "حدد موعد التسليم؟",
                    value:
                        "${controller.reciveDate} , ${controller.reciveWeekday} ,${controller.monthName},${controller.fromTime},${controller.toTime}",

                    imageUrl: imagesAssets.calenderImage,
                  ),
                ],
              ),
            ),
            CustomeTextRow(),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                  Text(
                    "تسلم يوم ${controller.reciveWeekday}",
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
