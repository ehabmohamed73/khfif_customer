import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khafif/controller/profile_controller.dart';
import 'package:khafif/core/constants/appColors.dart';
import 'package:khafif/core/constants/app_rootd.dart';
import 'package:khafif/core/constants/image_assets.dart';
import 'package:khafif/view/widgets/profile/edite_button.dart';
import 'package:khafif/view/widgets/profile/profile_listTile.dart';

class ProfilePage extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text(
          'حساب تعريفي',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColor.black,
          ),
        ),
        centerTitle: true,
        leading: const Icon(Icons.arrow_back, color: AppColor.black),
        actions: const [
          Icon(Icons.more_horiz, color: AppColor.black),
          SizedBox(width: 10),
        ],
      ),
      body: GetBuilder<ProfileController>(
        builder: (controller) {
          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: EditeButton(
                      onTap: () {
                        Get.toNamed(AppRoot.appEditInfoScreen);
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                  Column(
                    children: [
                      const SizedBox(height: 8),
                      Center(
                        child: Text(
                          controller.name,
                          style: const TextStyle(
                            color: AppColor.primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          controller.phone,
                          style: const TextStyle(
                            color: AppColor.black,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          controller.email,
                          style: const TextStyle(
                            color: AppColor.black,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      width: 100, // العرض الكلي للحاوية
                      height: 100, // الارتفاع الكلي للحاوية
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(imagesAssets.profile),
                          fit: BoxFit.cover, // يغطي كامل الدائرة
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),
              const Divider(),
              const ProfileListTile(title: 'مواقعي', icon: Icons.location_on),
              const ProfileListTile(
                title: 'عروضي الترويجية',
                icon: Icons.local_offer,
              ),
              const ProfileListTile(title: 'طرق الدفع', icon: Icons.payment),
              const ProfileListTile(title: 'رسائل', icon: Icons.message),
              const ProfileListTile(
                title: 'دعوة الأصدقاء',
                icon: Icons.group_add,
              ),
              const ProfileListTile(title: 'حماية', icon: Icons.security),
              const ProfileListTile(
                title: 'مركز المساعدة',
                icon: Icons.help_outline,
              ),
              const SizedBox(height: 16),
              const Divider(),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    controller.logout();
                  },
                  icon: const Icon(Icons.logout),
                  label: const Text('تسجيل الخروج'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primaryColor,
                    foregroundColor: AppColor.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 12,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          );
        },
      ),
    );
  }
}
