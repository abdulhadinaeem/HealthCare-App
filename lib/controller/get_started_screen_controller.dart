import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_images.dart';

class GetStartedScreenController extends GetxController {
  GetStartedScreenController({required this.context});
  BuildContext context;
  @override
  void onInit() {
    super.onInit();
    precacheImage(const AssetImage(AppImages.backgroungImage), context);
  }
}
