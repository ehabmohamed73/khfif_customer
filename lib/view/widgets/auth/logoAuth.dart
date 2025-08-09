import 'package:flutter/material.dart';
import 'package:khafif/core/constants/image_assets.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(imagesAssets.logo, height: 200);
  }
}
