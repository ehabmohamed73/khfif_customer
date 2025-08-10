import 'package:flutter/material.dart';

class CustomeText extends StatelessWidget {
  final String text;
  const CustomeText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Text(text, style: TextStyle(fontSize: 16, color: Colors.black)),
    );
  }
}
