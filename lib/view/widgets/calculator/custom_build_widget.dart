import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khafif/controller/price_calc_controller.dart';

class CustomBuildWidget extends GetView<PriceCalcController> {
  final String? title;
  final String? value;
  // final IconData? icon;
  final String imageUrl;

  const CustomBuildWidget({
    super.key,
    required this.title,
    required this.value,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    title!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(width: 6),
                ],
              ),
              TextButton(
                onPressed: () {
                  controller.changeThePlaces();
                },
                child: const Text(
                  'تغيير',
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              value!,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
