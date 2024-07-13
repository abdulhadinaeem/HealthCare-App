import 'package:get/get.dart';
import 'package:healthcare/view/auth/login/login_screen.dart';
import 'package:healthcare/routes/route_names.dart';
import 'package:healthcare/view/auth/register/register-screen.dart';
import 'package:healthcare/view/intro/get_started/get_started_screen.dart';
import 'package:healthcare/view/intro/splash/splash_screen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RouteNames.splashScreen,
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: RouteNames.loginScreen,
          page: () => const LoginScreen(),
        ),
        GetPage(
          name: RouteNames.registerScreen,
          page: () => const RegisterScreen(),
        ),
        GetPage(
          name: RouteNames.getStartedScreen,
          page: () => const GetStartedScreen(),
        ),
      ];
}
