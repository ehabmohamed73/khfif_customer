import 'package:flutter/material.dart';
import 'package:khafif/core/constants/appColors.dart';
import 'package:khafif/core/constants/image_assets.dart';
import 'package:khafif/view/widgets/sened_package/notice_row.dart';

class NoticeBox extends StatelessWidget {
  const NoticeBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: AppColor.gray2,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          NoticeRow(
            imageUrl: imagesAssets.nonShipmentImage,
            // أيقونة "ممنوع"
            text:
                "قد لا تكون البضائع مقبولة للشحن وفقاً للوائح دولة المنشأ/الوجهة",
          ),
          SizedBox(height: 12),
          NoticeRow(
            imageUrl: imagesAssets.shipmentTasxeImage, // أيقونة جمارك
            text: "قد تخضع الطرود لرسوم جمركية مختلفة وفقاً للوائح بلد الوجهة",
          ),
          SizedBox(height: 12),
          NoticeRow(
            imageUrl: imagesAssets.wightChenageImage, // أيقونة حاسبة
            text: "قد تتغير الأسعار بناءً على الوزن الفعلي للشحنة.",
          ),
        ],
      ),
    );
  }
}
