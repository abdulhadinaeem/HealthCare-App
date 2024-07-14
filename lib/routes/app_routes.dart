import 'package:get/get.dart';
import 'package:healthcare/controller/home_controller/home_screen_controller.dart';
import 'package:healthcare/view/auth/forget_password/forget_password.dart';
import 'package:healthcare/view/auth/login/login_screen.dart';
import 'package:healthcare/routes/route_names.dart';
import 'package:healthcare/view/auth/otp_screen/otp_verification_screen.dart';
import 'package:healthcare/view/auth/register/register-screen.dart';
import 'package:healthcare/view/complete_profile/complete_your_profile_screen_one.dart';
import 'package:healthcare/view/complete_profile/complete_your_profile_screen_two.dart';
import 'package:healthcare/view/home/home_screen.dart';
import 'package:healthcare/view/intro/dashboard_screen.dart';
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
          page: () => LoginScreen(),
        ),
        GetPage(
          name: RouteNames.forgetScreen,
          page: () => const ForgetPasswordScreen(),
        ),
        GetPage(
          name: RouteNames.registerScreen,
          page: () => const RegisterScreen(),
        ),
        GetPage(
          name: RouteNames.getStartedScreen,
          page: () => const GetStartedScreen(),
        ),
        GetPage(
          name: RouteNames.otpVerificationScreen,
          page: () => const OtpVerificationScreen(),
        ),
        GetPage(
          name: RouteNames.completeYourProfileScreenOne,
          page: () => const CompleteYourProfileScreenOne(),
        ),
        GetPage(
          name: RouteNames.completeYourProfileScreenTwo,
          page: () => const CompleteYourProfileScreenTwo(),
        ),
        GetPage(
          name: RouteNames.homeScreen,
          page: () => const HomeScreen(),
        ),
        GetPage(
          name: RouteNames.dashboardScreen,
          page: () => const DashboardScreen(),
        ),
      ];
}
