import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khafif/controller/send_controller/package_info_controller.dart';
import 'package:khafif/core/constants/appColors.dart';
import 'package:khafif/core/constants/image_assets.dart';
import 'package:khafif/view/widgets/auth/coustomAuthButton.dart';
import 'package:khafif/view/widgets/calculator/custom_header_calc.dart';
import 'package:khafif/view/widgets/calculator/shipment_type.dart';
import 'package:khafif/view/widgets/calculator/shipment_wight.dart';
import 'package:khafif/view/widgets/sened_package/build_progressline.dart';
import 'package:khafif/view/widgets/sened_package/build_step_itme.dart';
import 'package:khafif/view/widgets/sened_package/custome_pop_up.dart';
import 'package:khafif/view/widgets/shared/custome_text_shi.dart';

// صفة اختيار نوع الشحنة في مرحلة الشحن
class PackageInfo extends StatelessWidget {
  const PackageInfo({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PackageInfoController());
    return Scaffold(
      appBar: CustomHeaderCalc(title: "معلومات الطرد"),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: GetBuilder<PackageInfoController>(
          builder: (controller) {
            return Container(
              padding: EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 5,
                            spreadRadius: 1,
                            offset: Offset(5, 5),
                          ),
                        ],
                      ),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BuildStepItme(
                            imageUrl: imagesAssets.fromCityImage,
                            label: 'من',
                            done: true,
                          ),
                          Expanded(child: BuildProgressline()),
                          BuildStepItme(
                            imageUrl: imagesAssets.toCityImage,
                            label: 'الى',
                            done: true,
                          ),
                          Expanded(child: BuildProgressline()),
                          BuildStepItme(
                            imageUrl: imagesAssets.shipmentImage,
                            label: 'ماذا',
                            done: true,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),

                    // اختيار نوع الشحنة
                    CustomeTextShi(text: "اختر نوع الشحنة"),
                    SizedBox(height: 10),
                    ShipmentType(
                      onTap: (type) => controller.setShipmentType(type),
                      shipmentType: controller.shipmentType,
                    ),

                    const SizedBox(height: 25),
                    // اختيار وحدة الوزن
                    CustomeTextShi(text: "الوزن التقريبي للشحنة"),
                    const SizedBox(height: 10),
                    CustomeShipmentWight(
                      weightController: controller.weightController,
                      wightUnit: controller.weightUnit,
                      onWeightUnitChanged: (wight) =>
                          controller.setWeightUnit(wight),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(vertical: 20),

                      child: CoustomAuthButton(
                        text: "حساب السعر",
                        onPressed: customPopUp,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
