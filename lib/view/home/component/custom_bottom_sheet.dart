import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/constants/app_colors.dart';
import 'package:healthcare/controller/home_controller/home_screen_controller.dart';
import 'package:healthcare/services/user_services/user_services.dart';
import 'package:healthcare/view/complete_profile/component/group_button.dart';
import 'package:healthcare/view/home/component/custom_dropdown.dart';
import 'package:healthcare/widgets/buttons/custom_button.dart';

class CustomBottomSheet extends StatelessWidget {
  CustomBottomSheet({super.key, required this.controller});
  final TextEditingController controller;
  final UserServices userServices = UserServices();
  final HomeScreenController homeScreenController =
      Get.find<HomeScreenController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 3,
            ),
            Center(
              child: Container(
                height: 2,
                width: 30,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(2),
                  ),
                  color: AppColors.bottombarIconColor,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Select Type',
              style: context.textTheme.labelLarge,
            ),
            const CustomDropdown(),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Select Gender',
              style: context.textTheme.labelLarge,
            ),
            const CustomGroupButton(),
            SizedBox(
              height: context.height * 0.1,
            ),
            CustomButton(
              title: homeScreenController.isLoading.value
                  ? 'Loading...'
                  : 'Confirm',
              buttonColor: AppColors.buttonColor,
              onPressed: () async {
                final ButtonController buttonController =
                    Get.put(ButtonController());

                log('selectedText:${buttonController.selectedText},option: ${homeScreenController.selectedOption}');
                homeScreenController.isLoading.value = true;
                await userServices
                    .addUserData(
                  homeScreenController.selectedOption ?? '',
                  buttonController.selectedText,
                  DateTime.now(),
                )
                    .then((val) async {
                  await userServices.getUserData();
                  homeScreenController.isLoading.value = false;
                  Get.back();
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
