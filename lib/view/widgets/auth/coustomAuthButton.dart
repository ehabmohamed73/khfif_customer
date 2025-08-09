import 'package:flutter/material.dart';
import 'package:khafif/core/constants/appColors.dart';

class CoustomAuthButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const CoustomAuthButton({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(vertical: 15),
        onPressed: onPressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        color: AppColor.primaryColor,
        textColor: Colors.white,
        child: Text(text),
      ),
    );
  }
}
