import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khafif/controller/sened_package_controller.dart';
import 'package:khafif/core/constants/appColors.dart';
import 'package:khafif/core/constants/image_assets.dart';
import 'package:khafif/core/functions/format_time.dart';
import 'package:khafif/view/widgets/auth/coustomAuthButton.dart';
import 'package:khafif/view/widgets/calculator/custom_header_calc.dart';
import 'package:khafif/view/widgets/sened_package/address_card.dart';
import 'package:khafif/view/widgets/sened_package/build_progressline.dart';
import 'package:khafif/view/widgets/sened_package/build_step_itme.dart';
import 'package:khafif/view/widgets/sened_package/date_of_recive.dart';

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
                height: 110,
                child: ListView.builder(
                  itemCount: controller.addressList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    bool selected = index == controller.selectedLocation;
                    return GestureDetector(
                      onTap: () {
                        // هنا يمكنك إضافة منطق عند اختيار العنوان
                        controller.setselectedLocation(index);
                      },
                      child: AddressCard(
                        txtColor: selected
                            ? AppColor.white
                            : AppColor.primaryColor,
                        bgColor: selected
                            ? AppColor.secoundColor
                            : AppColor.fourthColor.withOpacity(0.3),
                        addressModel: controller.addressList[index],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 15),
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
                      child: DateOfRecive(
                        selected ? AppColor.primaryColor : AppColor.gray2,
                        index,
                        selected ? AppColor.white : AppColor.black,
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
                child: CoustomAuthButton(
                  text: 'استمر',
                  onPressed: () {
                    print(formatTimeOfDay(TimeOfDay.now()));
                    // استبدل '/nextScreen' بالمسار الصحيح
                  },
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
            formatTimeOfDay(time),
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
