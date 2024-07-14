import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthcare/routes/route_names.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    preloadLogo();
    checkAuthState();
  }

  void preloadLogo() {
    const SvgAssetLoader('assets/images/logo.svg');
  }

  void checkAuthState() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        User? user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          Get.offNamed(RouteNames.dashboardScreen);
        } else {
          Get.offNamed(RouteNames.getStartedScreen);
        }
      },
    );
  }
}
