import 'package:flutter/material.dart';
import 'package:khafif/core/constants/appColors.dart';

class ShipmentNumberAndStatuse extends StatelessWidget {
  final String shipmentNumber; // Example shipment number
  final String status; // Example status
  const ShipmentNumberAndStatuse({
    super.key,
    required this.shipmentNumber,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Text(
            "رقم الشحنة:   $shipmentNumber",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.primaryColor, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              status,
              style: TextStyle(fontSize: 16, color: AppColor.black),
            ),
          ),
        ],
      ),
    );
  }
}
