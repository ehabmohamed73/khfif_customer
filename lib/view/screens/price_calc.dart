import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khafif/controller/price_calc_controller.dart';
import 'package:khafif/view/widgets/auth/coustomAuthButton.dart';
import 'package:khafif/view/widgets/calculator/custom_calc_header2.dart';
import 'package:khafif/view/widgets/calculator/custom_dropdown_input.dart';
import 'package:khafif/view/widgets/calculator/custom_header_calc.dart';

class PriceCalc extends StatelessWidget {
  final PriceCalcController controller = Get.put(PriceCalcController());

  PriceCalc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomHeaderCalc(title: 'احسب سعر الشحن'),
      body: GetBuilder<PriceCalcController>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: ListView(
              children: [
                const SizedBox(height: 20),
                CustomCalcHeader2(title: "أين تتواجد الشحنة؟"),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  padding: const EdgeInsets.all(8.0),
                  child: const Text('من', style: TextStyle(fontSize: 16)),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: CustomDropdownInput(
                    (val) => controller.setFromCity(val),
                    controller.fromCity,
                    controller.cities
                        .map(
                          (city) => DropdownMenuItem<String>(
                            value: city,
                            child: Text(city, textDirection: TextDirection.rtl),
                          ),
                        )
                        .toList(),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  padding: const EdgeInsets.all(8.0),
                  child: const Text('الى', style: TextStyle(fontSize: 16)),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: CustomDropdownInput(
                    (val) => controller.setToCity(val),
                    controller.toCity,
                    controller.cities
                        .map(
                          (city) => DropdownMenuItem<String>(
                            value: city,
                            child: Text(city, textDirection: TextDirection.rtl),
                          ),
                        )
                        .toList(),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  height: 80,
                  child: CoustomAuthButton(
                    text: "التالي",
                    onPressed: () {
                      controller.goTONextscren();
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
