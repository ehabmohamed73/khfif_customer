// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:khafif/controller/send_controller/reciver_controller.dart';
// // import 'package:khafif/core/constants/appColors.dart';
// // import 'package:khafif/core/constants/image_assets.dart';
// // import 'package:khafif/view/widgets/auth/coustomAuthButton.dart';
// // import 'package:khafif/view/widgets/calculator/custom_dropdown_input.dart';
// // import 'package:khafif/view/widgets/calculator/custom_header_calc.dart';
// // import 'package:khafif/view/widgets/sened_package/build_progressline.dart';
// // import 'package:khafif/view/widgets/sened_package/build_step_itme.dart';
// // import 'package:khafif/view/widgets/sened_package/custome_input.dart';
// // import 'package:khafif/view/widgets/sened_package/custome_text.dart';

// class RevicerInfo extends StatelessWidget {
//   RevicerInfo({super.key});
//   final ReciverController controller = Get.put(ReciverController());
//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         appBar: CustomHeaderCalc(title: "معلومات المستلم"),
//         body: Container(
//           padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
//           child: GetBuilder<ReciverController>(
//             builder: (controller) => ListView(
//               children: [

//                 SizedBox(height: 20),
//                 CustomeText(text: "المحافظة* "),
//                 Container(
//                   height: 60,
//                   width: double.infinity,
//                   padding: EdgeInsets.all(16),
//                   margin: EdgeInsets.symmetric(horizontal: 16),
//                   decoration: BoxDecoration(
//                     color: AppColor.gray2,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: CustomDropdownInput(
//                     (val) => controller.setToCity(val),
//                     controller.toCity,
//                     controller.cities
//                         .map(
//                           (city) => DropdownMenuItem<String>(
//                             value: city,
//                             child: Text(city, textDirection: TextDirection.rtl),
//                           ),
//                         )
//                         .toList(),
//                   ),
//                 ),
//                 CustomeText(text: "المدينة * "),
//                 CustomeInput(textEditingController: controller.cityController),
//                 CustomeText(text: "الشارع * "),
//                 CustomeInput(
//                   textEditingController: controller.streetController,
//                 ),
//                 CustomeText(text: "الوصف"),
//                 CustomeInput(
//                   textEditingController: controller.descriptionController,
//                 ),
//                 SizedBox(height: 20),
//                 CustomeText(text: "اسم المستلم * "),
//                 CustomeInput(
//                   textEditingController: controller.reciverNameController,
//                 ),
//                 CustomeText(text: "رقم الهاتف * "),
//                 CustomeInput(
//                   textEditingController: controller.reciverPhoneController,
//                 ),
//                 SizedBox(height: 20),
//                 Row(
//                   children: [
//                     Checkbox(
//                       activeColor: AppColor.primaryColor,
//                       value: controller.rememberMe,
//                       onChanged: (value) {
//                         controller.toggleRememberMe();
//                       },
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: const Text('حفظ العنوان'),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 20),
//                 Container(
//                   margin: EdgeInsets.symmetric(horizontal: 16),
//                   width: double.infinity,
//                   height: 60,
//                   child: CoustomAuthButton(
//                     text: "التالي",
//                     onPressed: () {
//                       controller.goToPackageInfo();
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khafif/controller/send_controller/reciver_controller.dart';
import 'package:khafif/core/constants/appColors.dart';
import 'package:khafif/core/constants/image_assets.dart';
import 'package:khafif/view/screens/sened_package/reciver_address_list.dart';
import 'package:khafif/view/widgets/calculator/custom_header_calc.dart';
import 'package:khafif/view/widgets/sened_package/add_reciver_address.dart';
import 'package:khafif/view/widgets/sened_package/build_progressline.dart';
import 'package:khafif/view/widgets/sened_package/build_step_itme.dart';
import 'package:khafif/view/widgets/sened_package/custom_tapbutton.dart';

class RevicerInfo extends StatelessWidget {
  const RevicerInfo({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ReciverController());

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: CustomHeaderCalc(title: "معلومات المستلم"),
        body: GetBuilder<ReciverController>(
          builder: (controller) => Column(
            children: [
              // Stepper style header
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
                    const Expanded(child: BuildProgressline()),
                    BuildStepItme(
                      imageUrl: imagesAssets.toCityImage,
                      label: 'الى',
                      done: true,
                    ),
                    const Expanded(child: BuildProgressline()),
                    BuildStepItme(
                      imageUrl: imagesAssets.shipmentImage,
                      label: 'ماذا',
                      done: false,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Custom Tab Selector
              Container(
                margin: const EdgeInsets.all(12),
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    CustomTapbutton(
                      index: 0,
                      icon: Icons.location_history_outlined,
                      label: "دفتر العناوين",
                      controller: controller,
                    ),
                    CustomTapbutton(
                      index: 1,
                      icon: Icons.add_location_alt,
                      label: "أضف عنواناً جديداً",
                      controller: controller,
                    ),
                  ],
                ),
              ),

              // Tab content
              Expanded(
                child: controller.selectedTab == 0
                    ? ReciverAddressList()
                    : AddReciverAddress(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
