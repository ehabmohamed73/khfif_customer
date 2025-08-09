import 'package:flutter/material.dart';

class CustomAuthTitle extends StatelessWidget {
  final String text;
  const CustomAuthTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineSmall,
      textAlign: TextAlign.center,
    );
  }
}
