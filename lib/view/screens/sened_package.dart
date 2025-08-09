import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khafif/controller/sened_package_controller.dart';
import 'package:khafif/core/constants/appColors.dart';
import 'package:khafif/core/constants/image_assets.dart';
import 'package:khafif/view/widgets/calculator/custom_header_calc.dart';
import 'package:khafif/view/widgets/sened_package/address_card.dart';
import 'package:khafif/view/widgets/sened_package/build_progressline.dart';
import 'package:khafif/view/widgets/sened_package/build_step_itme.dart';

class SenedPackage extends StatelessWidget {
  SenedPackage({super.key});
  final SenedPackageController controller = Get.put(SenedPackageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeaderCalc(title: "ارسال الشحنة"),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: GetBuilder<SenedPackageController>(
          builder: (controller) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Progress bar
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 5,
                      spreadRadius: 1,
                      offset: Offset(5, 5),
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
                      done: false,
                    ),
                    Expanded(child: BuildProgressline()),
                    BuildStepItme(
                      imageUrl: imagesAssets.shipmentImage,
                      label: 'ماذا',
                      done: false,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // عنوان الاستلام
              Text(
                'عنوان المرسل',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                'الشحن من',
                style: TextStyle(fontSize: 13, color: Colors.grey[600]),
              ),
              SizedBox(height: 8),
              SizedBox(
                height: 120,

                child: ListView.builder(
                  itemCount: controller.addressList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return AddressCard(
                      addressModel: controller.addressList[index],
                    );
                  },
                ),
              ),
              SizedBox(height: 25),

              // اختيار التاريخ
              Text(
                'تاريخ الاستلام',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 8),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.dates.length,
                  itemBuilder: (context, index) {
                    bool selected = index == controller.selectedDateIndex;
                    return GestureDetector(
                      onTap: () {
                        controller.selectDate(index);
                      },
                      child: Container(
                        width: 60,
                        margin: EdgeInsets.symmetric(horizontal: 6),
                        decoration: BoxDecoration(
                          color: selected ? Colors.green : Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              controller.dates[index],
                              style: TextStyle(
                                color: selected ? Colors.white : Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              controller.weekdays[index],
                              style: TextStyle(
                                color: selected ? Colors.white : Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 20),

              // اختيار الوقت من - إلى
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTimeSelector(
                    'من',
                    controller.fromTime,
                    controller.setFromTime,
                    context,
                  ),
                  Text(
                    'الى',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  _buildTimeSelector(
                    'الى',
                    controller.toTime,
                    controller.setToTime,
                    context,
                  ),
                ],
              ),

              Spacer(),

              // زر التالي
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('التالي', style: TextStyle(fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildTimeSelector(
  String label,
  TimeOfDay time,
  Function(TimeOfDay) onTimeSelected,
  BuildContext context,
) {
  return Column(
    children: [
      Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
      SizedBox(height: 6),
      GestureDetector(
        onTap: () async {
          TimeOfDay? picked = await showTimePicker(
            context: context,
            initialTime: time,
          );
          if (picked != null) onTimeSelected(picked);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            _formatTimeOfDay(time),
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    ],
  );
}

String _formatTimeOfDay(TimeOfDay time) {
  final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
  final minute = time.minute.toString().padLeft(2, '0');
  final period = time.period == DayPeriod.am ? 'ص' : 'م';
  return '$hour:$minute $period';
}
