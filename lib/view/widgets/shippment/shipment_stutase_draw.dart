import 'package:flutter/material.dart';

class ShipmentStutaseDraw extends StatelessWidget {
  const ShipmentStutaseDraw({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Icon(Icons.inventory_2_outlined), // بداية الشحنة
          Expanded(
            child: Divider(
              color: Colors.black26,
              thickness: 1,
              endIndent: 4,
              indent: 4,
            ),
          ),
          Icon(Icons.inventory_2), // مرحلة وسيطة
          Expanded(
            child: Divider(
              color: Colors.black26,
              thickness: 1,
              endIndent: 4,
              indent: 4,
            ),
          ),
          Icon(Icons.local_shipping_outlined), // مرحلة النقل
          Expanded(
            child: Divider(
              color: Colors.black26,
              thickness: 1,
              endIndent: 4,
              indent: 4,
            ),
          ),
          Icon(Icons.check_circle, color: Colors.green),
        ],
      ),
    );
  }
}
