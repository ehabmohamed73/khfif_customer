import 'package:flutter/material.dart';

class CustomeTextShi extends StatelessWidget {
  final String text;
  const CustomeTextShi({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
