import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khafif/controller/send_controller/reciver_controller.dart';
import 'package:khafif/core/constants/appColors.dart';
import 'package:khafif/view/widgets/auth/coustomAuthButton.dart';
import 'package:khafif/view/widgets/calculator/custom_dropdown_input.dart';
import 'package:khafif/view/widgets/sened_package/custome_input.dart';
import 'package:khafif/view/widgets/sened_package/custome_text.dart';

class AddReciverAddress extends GetView<ReciverController> {
  // This widget is the root of your application.
  const AddReciverAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomeText(text: "المحافظة* "),
          Container(
            height: 60,
            width: double.infinity,
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: AppColor.gray2,
              borderRadius: BorderRadius.circular(10),
            ),
            child: CustomDropdownInput(
              (val) => controller.setToCity(val),
              controller.toCity,
              controller.cities
                  .map(
                    (city) => DropdownMenuItem<String>(
                      value: city,
                      child: Text(city, textDirection: TextDirection.rtl),
                    ),
                  )
                  .toList(),
            ),
          ),
          CustomeText(text: "المدينة * "),
          CustomeInput(textEditingController: controller.cityController),
          CustomeText(text: "الشارع * "),
          CustomeInput(textEditingController: controller.streetController),
          CustomeText(text: "الوصف"),
          CustomeInput(textEditingController: controller.descriptionController),
          SizedBox(height: 20),
          CustomeText(text: "اسم المستلم * "),
          CustomeInput(textEditingController: controller.reciverNameController),
          CustomeText(text: "رقم الهاتف * "),
          CustomeInput(
            textEditingController: controller.reciverPhoneController,
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Checkbox(
                activeColor: AppColor.primaryColor,
                value: controller.rememberMe,
                onChanged: (value) {
                  controller.toggleRememberMe();
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text('حفظ العنوان'),
              ),
            ],
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            height: 60,
            child: CoustomAuthButton(
              text: "التالي",
              onPressed: () {
                controller.goToPackageInfo();
              },
            ),
          ),
        ],
      ),
    );
  }
}
