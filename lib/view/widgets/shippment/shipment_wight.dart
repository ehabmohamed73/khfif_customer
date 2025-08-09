import 'package:flutter/material.dart';

class ShipmentWight extends StatelessWidget {
  final String shipmentWeight;
  const ShipmentWight({Key? key, required this.shipmentWeight})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text('$shipmentWeight كجم', style: TextStyle(fontSize: 14)),
        SizedBox(width: 4),
        Icon(Icons.scale_outlined, size: 15),
      ],
    );
  }
}
