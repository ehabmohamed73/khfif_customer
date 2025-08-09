// import 'package:flutter/material.dart';
// import 'package:khafif/core/constants/appColors.dart';

// class ShipmentDetials extends StatelessWidget {
//   final String shipmentSender; // Example sender
//   final String? shipmentType; // Example type
//   const ShipmentDetials({
//     super.key,
//     required this.shipmentSender,
//     this.shipmentType,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               Icon(Icons.laptop_mac, size: 30, color: AppColor.primaryColor),
//               SizedBox(width: 8),
//               Text(shipmentSender),
//             ],
//           ),

//           Row(
//             children: [
//               shipmentType == ""
//                   ? Text("غير محدد")
//                   : const Icon(Icons.broken_image_outlined),
//               SizedBox(width: 8),
//               Text(shipmentType ?? ""),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:khafif/core/constants/appColors.dart';

class ShipmentDetails extends StatelessWidget {
  final String shipmentSender;
  final String? shipmentType;

  const ShipmentDetails({
    super.key,
    required this.shipmentSender,
    this.shipmentType,
  });

  @override
  Widget build(BuildContext context) {
    final bool isShipmentTypeEmpty =
        shipmentType == null || shipmentType!.trim().isEmpty;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // جهة المرسل
          Row(
            children: [
              Icon(Icons.laptop_mac, size: 30, color: AppColor.primaryColor),
              const SizedBox(width: 8),
              Text(shipmentSender),
            ],
          ),

          // جهة نوع الشحنة
          Row(
            children: [
              isShipmentTypeEmpty
                  ? const Icon(Icons.error_outline, color: Colors.grey)
                  : const Icon(
                      Icons.broken_image_outlined,
                      color: Colors.green,
                    ),
              const SizedBox(width: 6),
              Text(
                isShipmentTypeEmpty ? "" : shipmentType!,
                style: TextStyle(
                  color: isShipmentTypeEmpty ? Colors.grey : Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
