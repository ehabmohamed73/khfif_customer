import 'package:flutter/material.dart';

class NoticeRow extends StatelessWidget {
  final String imageUrl;
  final String text;

  const NoticeRow({super.key, required this.imageUrl, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(child: Image.asset(imageUrl)),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
