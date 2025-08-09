import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khafif/controller/price_calc_controller.dart';
import 'package:khafif/core/constants/appColors.dart';
import 'package:khafif/view/widgets/auth/coustomAuthButton.dart';
import 'package:khafif/view/widgets/calculator/custom_calc_header2.dart';
import 'package:khafif/view/widgets/calculator/custom_header_calc.dart';

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
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: const Text(
                      "نوع الشحنة",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => controller.setShipmentType("وثيقة"),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: controller.shipmentType == "وثيقة"
                                  ? AppColor.primaryColor
                                  : AppColor.thirdColor,
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                "وثيقة",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => controller.setShipmentType("طرد"),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: controller.shipmentType == "طرد"
                                  ? AppColor.primaryColor
                                  : AppColor.thirdColor,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                "طرود",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: const Text(
                      "الوزن التقريبي",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),

                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: controller.weightController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "10",
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButton<String>(
                          value: controller.weightUnit,
                          onChanged: controller.setWeightUnit,
                          underline: const SizedBox(),
                          items: const [
                            DropdownMenuItem(value: "كجم", child: Text("كجم")),
                            DropdownMenuItem(value: "رطل", child: Text("رطل")),
                          ],
                        ),
                      ),
                    ],
                  ),
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
