import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khafif/controller/send_controller/confirm_controller.dart';
import 'package:khafif/core/constants/image_assets.dart';
import 'package:khafif/view/widgets/calculator/custom_build_widget.dart';
import 'package:khafif/view/widgets/calculator/custom_header_calc.dart';

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
                        value: controller.city,
                        imageUrl: imagesAssets.toCityImage,
                      ),
                      CustomBuildWidget(
                        title: "ماذا تريد أن تشحن؟",
                        value:
                            "${controller.weightValue} كجم، ${controller.shipmentType}",
                        imageUrl: imagesAssets.shipmentImage,
                      ),
                    ],
                  ),
                ),
          ],
        )
      ),
    );
  }
}
