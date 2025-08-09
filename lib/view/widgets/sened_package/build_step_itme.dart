import 'package:flutter/material.dart';

class BuildStepItme extends StatelessWidget {
  final String imageUrl;
  final String label;
  final bool done;

  // Constructor to initialize the properties
  const BuildStepItme({
    super.key,
    required this.imageUrl,
    required this.label,
    required this.done,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: done ? Colors.green : Colors.grey[300],
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.all(8),
          child: Image.asset(imageUrl, width: 40, height: 40),
        ),
        SizedBox(height: 6),
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
