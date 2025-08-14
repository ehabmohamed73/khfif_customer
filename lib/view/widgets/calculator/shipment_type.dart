// import 'package:flutter/material.dart';
// import 'package:khafif/core/constants/appColors.dart';

// class ShipmentType extends StatelessWidget {
//   final Function() onTap;
//   final String shipmentType;
//   const ShipmentType({
//     Key? key,
//     required this.onTap,
//     required this.shipmentType,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           child: GestureDetector(
//             onTap: () => onTap(),
//             child: Container(
//               padding: const EdgeInsets.symmetric(vertical: 12),
//               decoration: BoxDecoration(
//                 color: shipmentType == "وثيقة"
//                     ? AppColor.primaryColor
//                     : AppColor.thirdColor,
//                 borderRadius: const BorderRadius.only(
//                   topRight: Radius.circular(12),
//                   bottomRight: Radius.circular(12),
//                 ),
//               ),
//               child: const Center(
//                 child: Text("وثيقة", style: TextStyle(color: Colors.white)),
//               ),
//             ),
//           ),
//         ),
//         Expanded(
//           child: GestureDetector(
//             onTap: () => onTap(),
//             child: Container(
//               padding: const EdgeInsets.symmetric(vertical: 12),
//               decoration: BoxDecoration(
//                 color: shipmentType == "طرد"
//                     ? AppColor.primaryColor
//                     : AppColor.thirdColor,
//                 borderRadius: const BorderRadius.only(
//                   topLeft: Radius.circular(12),
//                   bottomLeft: Radius.circular(12),
//                 ),
//               ),
//               child: const Center(
//                 child: Text("طرود", style: TextStyle(color: Colors.white)),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:khafif/core/constants/appColors.dart';

class ShipmentType extends StatelessWidget {
  final Function(String) onTap;
  final String shipmentType;

  const ShipmentType({
    Key? key,
    required this.onTap,
    required this.shipmentType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => onTap("وثيقة"),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: shipmentType == "وثيقة"
                    ? AppColor.primaryColor
                    : AppColor.thirdColor,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: const Center(
                child: Text("وثيقة", style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () => onTap("طرد"),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: shipmentType == "طرد"
                    ? AppColor.primaryColor
                    : AppColor.thirdColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
              child: const Center(
                child: Text("طرود", style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
