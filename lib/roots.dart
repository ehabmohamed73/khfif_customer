import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:khafif/core/constants/app_rootd.dart';
import 'package:khafif/core/middleware/mymiddleware.dart';
import 'package:khafif/view/screens/auth/OTP.dart';
import 'package:khafif/view/screens/auth/forget_password.dart';
import 'package:khafif/view/screens/auth/login.dart';
import 'package:khafif/view/screens/auth/signup.dart';
import 'package:khafif/view/screens/edit_info.dart';
import 'package:khafif/view/screens/home.dart';
import 'package:khafif/view/screens/onboarding.dart';
import 'package:khafif/view/screens/price_calc.dart';
import 'package:khafif/view/screens/price_calc_show.dart';
import 'package:khafif/view/screens/price_calc_type.dart';
import 'package:khafif/view/screens/splash_screen.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
    name: "/",
    page: () => const SplashScreen(),
    middlewares: [MyMiddleWare()],
  ),
  // GetPage(name: "/splash", page: () => const SplashScreen()),
  GetPage(name: AppRoot.appOnBoardingScreen, page: () => const OnBoarding()),
  GetPage(name: AppRoot.appLoginScreen, page: () => Login()),
  GetPage(name: AppRoot.otpScreen, page: () => const Otp()),
  GetPage(name: AppRoot.appHomeScreen, page: () => Home()),
  GetPage(name: AppRoot.appEditInfoScreen, page: () => EditInfoPage()),
  GetPage(name: AppRoot.appRegisterScreen, page: () => SignUp()),
  GetPage(
    name: AppRoot.appForgetPasswordScreen,
    page: () => const ForgetPassword(),
  ),
  GetPage(name: AppRoot.priceTypeCalcScreen, page: () => PriceCalcType()),
  GetPage(name: AppRoot.priceCalcShowScreen, page: () => PriceCalcShow()),
  GetPage(name: AppRoot.priceCalc, page: ()=> PriceCalc())
  // Add other routes here as needed
];
