import 'package:flutter/material.dart';

class BuildProgressline extends StatelessWidget {
  const BuildProgressline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3,
      color: Colors.green.withOpacity(0.5),
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
    );
  }
}
