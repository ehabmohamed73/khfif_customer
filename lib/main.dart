import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khafif/binding.dart';
import 'package:khafif/core/constants/appColors.dart';
import 'package:khafif/core/services/inti_services.dart';
import 'package:khafif/roots.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await intialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Cairo',
          scaffoldBackgroundColor: AppColor.backgroundColor,
          appBarTheme: AppBarTheme(
            backgroundColor: AppColor.backgroundColor,
            elevation: 0,
          ),
        ),
        initialBinding: MyBinding(),
        getPages: routes,
      ),
    );
  }
}
