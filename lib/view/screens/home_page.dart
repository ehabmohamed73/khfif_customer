import 'package:flutter/material.dart';
import 'package:khafif/core/constants/appColors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("الصفحة الرئيسية"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // العنوان العلوي (تسليم إلى - زر الموقع)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "تسليم إلى",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "حدد موقعك",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Icon(Icons.arrow_drop_down, color: Colors.green),
                      ],
                    ),
                  ],
                ),
                const CircleAvatar(
                  backgroundColor: Color(0xFFF5F5F5),
                  child: Icon(
                    Icons.notification_add_outlined,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // حقل البحث
            Container(
              child: TextField(
                decoration: InputDecoration(
                  focusColor: AppColor.secoundColor,
                  hintText: 'رقم الشحنة',
                  hintStyle: TextStyle(color: AppColor.primaryColor),
                  filled: true,
                  fillColor: Colors.white24,

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                style: TextStyle(color: AppColor.primaryColor),
              ),
            ),

            // الترحيب
            Text("أهلا", style: TextStyle(fontSize: 18, color: Colors.black54)),
            const Text(
              "ايهاب",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            const Center(
              child: Text(
                "ماذا ترسل اليوم؟",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 32),
            // شبكة العناصر الثلاثة
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildItem(
                    icon: Icons.local_pizza,
                    title: "توصيل الطعام",
                    subtitle: "(أقل من 10 كجم)",
                  ),
                  _buildItem(
                    icon: Icons.inventory_2,
                    title: "طرد",
                    subtitle: "(أكثر من 10 كجم)",
                  ),
                  _buildItem(
                    icon: Icons.shopping_cart,
                    title: "سوبر ماركت /نقّالة",
                    subtitle: "(أكثر من 10 كجم)",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 48, color: Colors.green),
          const SizedBox(height: 16),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 13, color: Colors.green),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//         children: [
//           Container(
//             padding: EdgeInsets.all(12),
//             color: Color(0xFF9C27B0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Expanded(
//                   child: TextField(
//                     decoration: InputDecoration(
//                       hintText: 'رقم شحنتي',
//                       hintStyle: TextStyle(color: Colors.white),
//                       filled: true,
//                       fillColor: Colors.white24,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//                 SizedBox(width: 12),
//                 Column(
//                   children: [
//                     Icon(Icons.nightlight_round, color: Colors.yellowAccent),
//                     Text('مساء الخير', style: TextStyle(color: Colors.white)),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 10),
//           ListTile(
//             leading: Icon(Icons.inventory, color: Colors.brown),
//             title: Text('شحنتي'),
//             subtitle: Text('حالة الشحنة'),
//             trailing: Icon(Icons.local_shipping),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.red[700],
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               padding: EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'STAY SHARP.',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     "If it’s not from our app or verified account, it’s not us.\nDon’t click,\nDon’t pay,\nDon’t share.",
//                     style: TextStyle(color: Colors.white, fontSize: 14),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       );
//   }
// }
