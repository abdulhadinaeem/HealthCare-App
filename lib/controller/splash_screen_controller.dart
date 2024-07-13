import 'package:get/get.dart';
import 'package:healthcare/routes/route_names.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Get.offNamed(RouteNames.getStartedScreen);
      },
    );
    super.onInit();
  }
}
