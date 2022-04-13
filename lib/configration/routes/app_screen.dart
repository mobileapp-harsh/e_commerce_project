import 'package:e_commerce_project/configration/routes/app_routes.dart';
import 'package:e_commerce_project/modules/home_page/screen/home_screen.dart';
import 'package:e_commerce_project/modules/splash_screen/screen/splash_screen.dart';
import 'package:get/get.dart';

class AppScreens {
  static var list = [
    GetPage(
      name: AppRoutes.SPLASH_SCREEN,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.HOME_SCREEN,
      page: () => const HomeScreen(),
    ),
  ];
}
