import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khafif/controller/shippment_controller.dart';
import 'package:khafif/core/constants/appColors.dart';
import 'package:khafif/view/widgets/shippment/buildTabButton.dart';
import 'package:khafif/view/widgets/shippment/build_shipment_State.dart';

class ShipmentsPage extends StatelessWidget {
  ShipmentsPage({super.key});

  final ShipmentsController controller = Get.put(ShipmentsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'شحناتي',
          style: TextStyle(color: AppColor.primaryColor),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward, color: AppColor.primaryColor),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Buildtabbutton(title: 'المرسلة', index: 1),
              // const SizedBox(width: 12),
              // Buildtabbutton(title: 'الواردة', index: 0),
              BuildTabButton('المرسلة', 1),
              const SizedBox(width: 12),
              BuildTabButton('الواردة', 0),
            ],
          ),
          const SizedBox(height: 32),
          Expanded(
            child: Obx(() {
              if (controller.selectedTab.value == 0) {
                return BuildShipmentState(
                  "لا توجد شحنات واردة",
                  controller.incomingShipments,
                );
              } else {
                return BuildShipmentState(
                  "لا توجد شحنات مرسلة",
                  controller.outgoingShipments,
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
