import 'package:flutter/material.dart';

class CustomeInputSend extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final TextInputType keyboardType;
  final void Function(String?)? onWeightUnitChanged;
  const CustomeInputSend({
    Key? key,
    required this.textEditingController,
    required this.hintText,
    required this.keyboardType,
    this.onWeightUnitChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
