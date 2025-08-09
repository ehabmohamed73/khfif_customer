import 'package:flutter/material.dart';

class CoustomTextFormOuth extends StatelessWidget {
  final String? textLable;
  final String? textHint;
  final IconData? textIcon;
  final TextEditingController? myController;
  final String? Function(String?) validFiled;
  final TextInputType? keyboardType;
  final bool? isObscureText;
  const CoustomTextFormOuth({
    super.key,
    this.textLable,
    this.textHint,
    this.textIcon,
    required this.myController,
    required this.validFiled,
    this.keyboardType,
    this.isObscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: TextFormField(
        obscureText: isObscureText == null || isObscureText == false
            ? false
            : true,
        keyboardType: keyboardType,
        controller: myController,
        validator: validFiled,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: textHint!,
        ),
      ),
    );
  }
}
