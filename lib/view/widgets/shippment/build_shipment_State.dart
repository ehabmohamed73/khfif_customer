// import 'package:flutter/material.dart';
// import 'package:khafif/core/constants/image_assets.dart';
// import 'package:khafif/view/widgets/shippment/shipment_detials.dart';
// import 'package:khafif/view/widgets/shippment/shipment_number.dart';
// import 'package:khafif/view/widgets/shippment/shipment_stutase_draw.dart';
// import 'package:khafif/view/widgets/shippment/shipment_wight.dart';
// import 'package:lottie/lottie.dart';

// Widget BuildShipmentState(String message) {

//   return Column(
//     mainAxisAlignment: MainAxisAlignment.start,
//     children: [
//       Container(
//         margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//         padding: const EdgeInsets.all(8),
//         decoration: ShapeDecoration(
//           color: Colors.white,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//           shadows: [
//             BoxShadow(
//               color: Color(0x190D0A2C),
//               blurRadius: 20,
//               offset: Offset(0, 6),
//               spreadRadius: 0,
//             ),
//           ],
//         ),
//         child: Column(
//           children: [
//             // Header with shipment number and status
//             ShipmentNumberAndStatuse(
//               shipmentNumber: "123456789",
//               status: "قيد الشحن",
//             ),
//             // Shipment details
//             ShipmentDetails(
//               shipmentSender: "مكتبة جرير ",
//               // shipmentType: "قابل للكسر",
//             ),
//             const SizedBox(height: 24),

//             // ✅ Row: حالة الشحنات بالأيقونات المتسلسلة
//             ShipmentStutaseDraw(),
//             SizedBox(height: 16),
//             //الوزن
//             ShipmentWight(shipmentWeight: "5.0"),
//           ],
//         ),
//       ),
//       Lottie.asset(
//         imagesAssets.emptyBox,
//         width: 220,
//         height: 220,
//         repeat: true,
//       ),
//       const SizedBox(height: 16),
//       Text(message, style: const TextStyle(fontSize: 16)),
//     ],
//   );
// }

import 'package:flutter/material.dart';
import 'package:khafif/core/constants/image_assets.dart';
import 'package:khafif/view/widgets/shippment/shipment_detials.dart';
import 'package:khafif/view/widgets/shippment/shipment_number.dart';
import 'package:khafif/view/widgets/shippment/shipment_stutase_draw.dart';
import 'package:khafif/view/widgets/shippment/shipment_wight.dart';
import 'package:lottie/lottie.dart';

Widget BuildShipmentState(String message, List<dynamic> shipments) {
  if (shipments.isEmpty) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
          imagesAssets.emptyBox,
          width: 220,
          height: 220,
          repeat: true,
        ),
        const SizedBox(height: 16),
        Text(message, style: const TextStyle(fontSize: 16)),
      ],
    );
  } else {
    return ListView.builder(
      itemCount: shipments.length,
      itemBuilder: (context, index) {
        final shipment = shipments[index];
        return Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              padding: const EdgeInsets.all(8),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x190D0A2C),
                    blurRadius: 20,
                    offset: Offset(0, 6),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  ShipmentNumberAndStatuse(
                    shipmentNumber: shipment['number'],
                    status: shipment['status'],
                  ),
                  ShipmentDetails(
                    shipmentSender: shipment['sender'],
                    shipmentType: shipment['type'],
                  ),
                  const SizedBox(height: 24),
                  ShipmentStutaseDraw(),
                  const SizedBox(height: 16),
                  ShipmentWight(shipmentWeight: shipment['weight']),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
