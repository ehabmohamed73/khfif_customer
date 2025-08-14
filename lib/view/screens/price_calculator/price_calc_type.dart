import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khafif/controller/price_calc_controller.dart';
import 'package:khafif/view/widgets/auth/coustomAuthButton.dart';
import 'package:khafif/view/widgets/calculator/custom_calc_header2.dart';
import 'package:khafif/view/widgets/calculator/custom_header_calc.dart';
import 'package:khafif/view/widgets/calculator/shipment_wight.dart';
import 'package:khafif/view/widgets/shared/custome_text_shi.dart';
import 'package:khafif/view/widgets/calculator/shipment_type.dart';

class PriceCalcType extends StatelessWidget {
  const PriceCalcType({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PriceCalcController());
    return Scaffold(
      appBar: CustomHeaderCalc(title: 'احسب سعر الشحن'),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GetBuilder<PriceCalcController>(
            builder: (controller) {
              return ListView(
                children: [
                  // زر الحصول على سعر شحنتي
                  const SizedBox(height: 16),
                  CustomCalcHeader2(title: "ماذا تريد أن تشحن؟"),
                  const SizedBox(height: 16),
                  CustomeTextShi(text: "اختر نوع الشحنة"),

                  const SizedBox(height: 10),

                  // اختيار نوع الشحنة
                  ShipmentType(
                    onTap: (type) => controller.setShipmentType(type),
                    shipmentType: controller.shipmentType,
                  ),

                  const SizedBox(height: 25),

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
                    margin: const EdgeInsets.symmetric(vertical: 20),

                    child: CoustomAuthButton(
                      text: "حساب السعر",
                      onPressed: controller.goToLastScreen,
                    ),
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
