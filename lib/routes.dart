import 'package:biz/screens/filter_screen.dart';
import 'package:biz/screens/home_screen.dart';
import 'package:biz/screens/main_screen.dart';
import 'package:biz/screens/login_screen.dart';
import 'package:biz/screens/signup_screen.dart';
import 'package:biz/screens/talent_screen.dart';
import 'package:biz/utils/constants.dart';
import 'package:get/get.dart';

class Routes {
  static var pages = [
    // GetPage(
    //   name: NamedRoutes.routeDevelopment,
    //   page: () => DevelopmentScreen(),
    //   transition: Transition.downToUp,
    // ),
    GetPage(
      name: NamedRoutes.routeLogin,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: NamedRoutes.routeSignUp,
      page: () => SignUpScreen(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 200),
    ),
    GetPage(
      name: NamedRoutes.routeHome,
      page: () => HomeScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 200),
    ),
    GetPage(
      name: NamedRoutes.routeMain,
      page: () => MainScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 200),
    ),
    GetPage(
      name: NamedRoutes.routeTalent,
      page: () => TalentScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 200),
    ),
    GetPage(
      name: NamedRoutes.routeFilter,
      page: () => FilterScreen(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 200),
    ),
  ];
}
