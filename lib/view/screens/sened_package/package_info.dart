import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khafif/controller/send_controller/package_info_controller.dart';
import 'package:khafif/core/constants/appColors.dart';
import 'package:khafif/core/constants/image_assets.dart';
import 'package:khafif/data/datasource/static/static.dart';
import 'package:khafif/view/widgets/auth/coustomAuthButton.dart';
import 'package:khafif/view/widgets/calculator/custom_header_calc.dart';
import 'package:khafif/view/widgets/calculator/shipment_type.dart';
import 'package:khafif/view/widgets/calculator/shipment_wight.dart';
import 'package:khafif/view/widgets/sened_package/build_progressline.dart';
import 'package:khafif/view/widgets/sened_package/build_step_itme.dart';
import 'package:khafif/view/widgets/sened_package/chose_car.dart';
import 'package:khafif/view/widgets/sened_package/custome_input_send.dart';
import 'package:khafif/view/widgets/sened_package/custome_pop_up.dart';
import 'package:khafif/view/widgets/shared/custome_text_shi.dart';

// صفة اختيار نوع الشحنة في مرحلة الشحن
class PackageInfo extends StatelessWidget {
  const PackageInfo({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(PackageInfoController());
    return Scaffold(
      appBar: CustomHeaderCalc(title: "معلومات الطرد"),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: GetBuilder<PackageInfoController>(
          builder: (controller) {
            return Container(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 5,
                            spreadRadius: 1,
                            offset: const Offset(5, 5),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BuildStepItme(
                            imageUrl: imagesAssets.fromCityImage,
                            label: 'من',
                            done: true,
                          ),
                          Expanded(child: BuildProgressline()),
                          BuildStepItme(
                            imageUrl: imagesAssets.toCityImage,
                            label: 'الى',
                            done: true,
                          ),
                          Expanded(child: BuildProgressline()),
                          BuildStepItme(
                            imageUrl: imagesAssets.shipmentImage,
                            label: 'ماذا',
                            done: true,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // اختيار نوع الشحنة
                    CustomeTextShi(text: "اختر نوع الشحنة"),
                    const SizedBox(height: 10),
                    ShipmentType(
                      onTap: (type) => controller.setShipmentType(type),
                      shipmentType: controller.shipmentType,
                    ),
                    const SizedBox(height: 25),
                    // اختيار وحدة الوزن
                    CustomeTextShi(text: "الوزن التقريبي للشحنة"),
                    const SizedBox(height: 10),
                    CustomeShipmentWight(
                      weightController: controller.weightController,
                      wightUnit: controller.weightUnit,
                      onWeightUnitChanged: (wight) =>
                          controller.setWeightUnit(wight),
                    ),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 800),
                      transitionBuilder: (child, animation) {
                        final offsetAnim = Tween<Offset>(
                          begin: const Offset(0, -0.3), // من فوق
                          end: Offset.zero,
                        ).animate(animation);
                        return SlideTransition(
                          position: offsetAnim,
                          child: ScaleTransition(
                            scale: animation,
                            child: child,
                          ),
                        );
                      },
                      child: controller.shipmentType == "وثيقة"
                          ? const SizedBox(key: ValueKey("doc"), height: 10)
                          : Column(
                              key: const ValueKey("package"),
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: CustomeTextShi(text: "وصف الشحنة"),
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          CustomeTextShi(text: "قيمة الشحنة "),
                                          InkWell(
                                            onTap: () {
                                              customPopUp(
                                                "القيمة المعلنة للبضائع",
                                                "تمثل سعر الشحنة في السوق  لمحتويات الشحنة ",
                                                () => Get.back(),
                                              );
                                            },
                                            child: const Icon(
                                              Icons.info_outline,
                                              color: Colors.blue,
                                              size: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: CustomeInputSend(
                                        textEditingController: controller
                                            .shipmentDescriptionController,
                                        hintText: "مثال:قميص,حقيبة",
                                        keyboardType: TextInputType.text,
                                        onWeightUnitChanged: null,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: CustomeInputSend(
                                        hintText: "ريال",
                                        keyboardType: TextInputType.number,
                                        textEditingController:
                                            controller.shipmentPrice,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                CustomeTextShi(
                                  text: "حجم الشحنة يناسب النقل في",
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: const [
                                    ChoseCar(
                                      index: 0,
                                      text: "صغيرة",
                                      icon: Icons.motorcycle_outlined,
                                    ),
                                    ChoseCar(
                                      index: 1,
                                      text: "متوسطة",
                                      icon: Icons.directions_car_outlined,
                                    ),
                                    ChoseCar(
                                      index: 2,
                                      text: "كبيرة",
                                      icon: Icons.local_shipping_outlined,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                BoxInfoContainer(
                                  imageAssetPath: imagesAssets.shipningBoxImage,
                                ),
                              ],
                            ),
                    ),
                    const SizedBox(height: 10),
                    // ملاحظة هامة
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        color: AppColor.gray2,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            imagesAssets.nonShipmentImage,
                            height: 50,
                            width: 50,
                          ),
                          const SizedBox(width: 8),
                          const Expanded(
                            child: Text(
                              "قد لا تكون البضائع مقبولة للشحن وفقاً للوائح الدولة",
                              style: TextStyle(fontSize: 14, color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // زر حساب السعر
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      child: CoustomAuthButton(
                        text: "حساب السعر",
                        onPressed: () {
                          customPopUp(
                            "تقدير الوزن.",
                            "الرجاء التأكد من الوزن بعد التغليف لتجنب أي تأخر في التوصيل، "
                                "قد يتغير السعر في حالة وجود اختلاف في الوزن",
                            () => controller.goToPriceAndCheckOutScreen(),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class BoxInfoContainer extends GetView<PackageInfoController> {
  final String? imageAssetPath;

  const BoxInfoContainer({super.key, this.imageAssetPath});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(16),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: imageAssetPath != null
                    ? Image.asset(
                        imageAssetPath!,
                        fit: BoxFit.contain,
                        errorBuilder: (_, __, ___) =>
                            const _BoxIconPlaceholder(),
                      )
                    : const _BoxIconPlaceholder(),
              ),
            ),
            // النص + القيم
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "أقصى أبعاد الصندوق والوزن",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  GridView.count(
                    crossAxisCount: 4,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 2,
                    children: [
                      if (controller.selectedCarIndex == 0) ...[
                        _InfoTile(
                          label: "الارتفاع",
                          value: "${shipmentSize[0]["height"]} سم",
                        ),
                        _InfoTile(
                          label: "الطول",
                          value: "${shipmentSize[0]["length"]} سم",
                        ),
                        _InfoTile(
                          label: "العرض",
                          value: "${shipmentSize[0]["width"]} سم",
                        ),
                        _InfoTile(
                          label: "الوزن",
                          value: "${shipmentSize[0]["wight"]} كجم",
                        ),
                      ] else if (controller.selectedCarIndex == 1) ...[
                        _InfoTile(
                          label: "الارتفاع",
                          value: "${shipmentSize[1]["height"]} سم",
                        ),
                        _InfoTile(
                          label: "الطول",
                          value: "${shipmentSize[1]["length"]} سم",
                        ),
                        _InfoTile(
                          label: "العرض",
                          value: "${shipmentSize[1]["width"]} سم",
                        ),
                        _InfoTile(
                          label: "الوزن",
                          value: "${shipmentSize[1]["wight"]} كجم",
                        ),
                      ] else if (controller.selectedCarIndex == 2) ...[
                        _InfoTile(
                          label: "الارتفاع",
                          value: "${shipmentSize[2]["height"]} سم",
                        ),
                        _InfoTile(
                          label: "الطول",
                          value: "${shipmentSize[2]["length"]} سم",
                        ),
                        _InfoTile(
                          label: "العرض",
                          value: "${shipmentSize[2]["width"]} سم",
                        ),
                        _InfoTile(
                          label: "الوزن",
                          value: "${shipmentSize[2]["wight"]} كجم",
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final String label;
  final String value;
  const _InfoTile({required this.label, required this.value});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.zero,
      title: Text(
        label,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(value, style: const TextStyle(fontSize: 12)),
    );
  }
}

class _BoxIconPlaceholder extends StatelessWidget {
  const _BoxIconPlaceholder();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade300,
      child: const Center(
        child: Icon(Icons.inventory, size: 40, color: Colors.grey),
      ),
    );
  }
}
