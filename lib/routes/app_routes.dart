import 'package:dial/presentation/dashboard_screen/binding/dashboard_screen_binding.dart';
import 'package:dial/presentation/dashboard_screen/dashboard_screen.dart';
import 'package:dial/presentation/login_screen/binding/login_screen_binding.dart';
import 'package:dial/presentation/login_screen/login_screen.dart';
import 'package:dial/presentation/permission_screen/binding/permission_screen_binding.dart';
import 'package:dial/presentation/permission_screen/permission_screen.dart';
import 'package:get/get.dart';

import '../presentation/splash_screen/binding/splash_screen_binding.dart';
import '../presentation/splash_screen/splash_screen.dart';

class AppRoutes {
  static const String splashScreenRoute = '/splash_screen';
  static const String loginScreenRoute = '/login_screen';
  static const String dashboardScreenRout = '/dashboard_screen';
  static const String permissionScreenRout = '/permission_screen';

  static List<GetPage> pages = [
    GetPage(
        name: splashScreenRoute,
        page: () => const SplashScreen(),
        bindings: [
          SplashScreenBinding(),
        ],
        transitionDuration: const Duration(milliseconds: 150)),
    GetPage(
        name: loginScreenRoute,
        page: () => const LoginScreen(),
        bindings: [
          LoginScreenBinding(),
        ],
        transition: Transition.downToUp,
        transitionDuration: const Duration(milliseconds: 150)),
    GetPage(
        name: permissionScreenRout,
        page: () => const PermissionScreen(),
        bindings: [
          PermissionScreenBinding(),
        ],
        transition: Transition.downToUp,
        transitionDuration: const Duration(milliseconds: 150)),
    GetPage(
        name: dashboardScreenRout,
        page: () => DashBoardScreen(),
        bindings: [
          DashBoardScreenBinding(),
        ],
        transition: Transition.downToUp,
        transitionDuration: const Duration(milliseconds: 150)),
  ];
}
