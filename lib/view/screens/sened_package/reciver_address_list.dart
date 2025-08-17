import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khafif/controller/send_controller/reciver_controller.dart';
import 'package:khafif/core/constants/appColors.dart';
import 'package:khafif/data/datasource/static/static.dart';

class ReciverAddressList extends GetView<ReciverController> {
  const ReciverAddressList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: addresses.length,
      itemBuilder: (context, index) {
        final item = addresses[index];
        return Card(
          color: AppColor.white,
          elevation: 2,
          margin: const EdgeInsets.symmetric(vertical: 6),
          child: ListTile(
            leading: const Icon(Icons.more_vert, color: AppColor.primaryColor),
            title: Text(
              item["type"]!,
              style: const TextStyle(
                color: AppColor.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item["location"]!),
                Row(
                  children: [
                    Text(
                      item["phone"]!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.flag, size: 16, color: Colors.green),
                  ],
                ),
                Text(item["country"]!),
              ],
            ),
            onTap: () {
              controller.goToPackageInfo();
            },
          ),
        );
      },
    );
  }
}
