import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthcare/constants/app_images.dart';
import 'package:intl_phone_field/countries.dart';

class CompleteProfileScreenOneController extends GetxController {
  String? selectedCountry = '';
  List<Country> countryList = [];
  TextEditingController country = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    const SvgAssetLoader(AppImages.addProfilePhoto);
    const SvgAssetLoader(AppImages.addDocumentButton);
  }
}
