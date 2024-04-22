import 'package:get/get.dart';
import 'package:to_do_list_apk/app/config/routes.dart';
import 'package:to_do_list_apk/app/modules/home/binding/home_binding.dart';
import 'package:to_do_list_apk/app/modules/home/home.dart';
import 'package:to_do_list_apk/app/modules/login/login.dart';
import 'package:to_do_list_apk/app/modules/register/register.dart';

class AppRouter {
  static final pages = [
    GetPage(
      name: AppRoutes.homeScreen.name,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.loginScreen.name,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: AppRoutes.registerScreen.name,
      page: () => const RegisterScreen(),
    ),
  ];
}
