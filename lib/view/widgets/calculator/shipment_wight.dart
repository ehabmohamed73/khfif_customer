import 'package:flutter/material.dart';
import 'package:khafif/view/widgets/sened_package/custome_input_send.dart';

class CustomeShipmentWight extends StatelessWidget {
  final TextEditingController weightController;
  final String wightUnit;
  final void Function(String?)? onWeightUnitChanged;
  const CustomeShipmentWight({
    super.key,
    required this.weightController,
    required this.wightUnit,
    this.onWeightUnitChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomeInputSend(
            textEditingController: weightController,
            hintText: "4",
            keyboardType: TextInputType.number,
            onWeightUnitChanged: null,
          ),
        ),
        const SizedBox(width: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey, width: 1),
          ),
          child: DropdownButton<String>(
            value: wightUnit,
            onChanged: onWeightUnitChanged,
            underline: const SizedBox(),
            items: const [
              DropdownMenuItem(value: "كجم", child: Text("كجم")),
              DropdownMenuItem(value: "رطل", child: Text("رطل")),
            ],
          ),
        ),
      ],
    );
  }
}
