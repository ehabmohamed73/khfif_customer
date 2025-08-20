import 'package:flutter/material.dart';

class CustomeTextRow extends StatelessWidget {
  const CustomeTextRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(Icons.info_outline, color: Colors.blue, size: 20),
        SizedBox(width: 6),
        Text(
          'تم حساب السعر بناءً على\n المناق المحددة ووزن الشحنة',
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
