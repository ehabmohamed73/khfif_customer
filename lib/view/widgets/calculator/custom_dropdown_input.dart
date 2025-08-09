import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:khafif/controller/price_calc_controller.dart';

class CustomDropdownInput extends GetView<PriceCalcController> {
  final String? selectedValue;
  final void Function(String?)? onChanged;

  // This widget is used to create a custom dropdown input for selecting cities.
  // It uses GetX for state management and updates the selected city dynamically.
  const CustomDropdownInput(this.onChanged, this.selectedValue, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PriceCalcController>(
      builder: (controller) {
        return DropdownButton<String>(
          value: selectedValue,
          onChanged: onChanged,
          items: controller.cities
              .map(
                (city) => DropdownMenuItem(
                  value: city,
                  child: Text(city, textDirection: TextDirection.rtl),
                ),
              )
              .toList(),
          isExpanded: true,
          hint: const Text('اختر المدينة', textDirection: TextDirection.rtl),
          underline: const SizedBox(),
          icon: const Icon(Icons.arrow_drop_down),
        );
      },
    );
  }
}
