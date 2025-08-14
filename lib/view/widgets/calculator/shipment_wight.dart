import 'package:flutter/material.dart';

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
          child: TextFormField(
            controller: weightController,
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
