import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/constants/app_colors.dart';
import 'package:healthcare/routes/route_names.dart';

import 'package:healthcare/view/complete_profile/component/group_button.dart';
import 'package:healthcare/widgets/buttons/custom_button.dart';
import 'package:healthcare/widgets/input/custom_text_field.dart';

import '../../controller/complete_profile_controller/complete_profile_s_two_controller.dart';

class CompleteYourProfileScreenTwo extends StatelessWidget {
  const CompleteYourProfileScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompleteProfileSTwoController>(
        init: CompleteProfileSTwoController(),
        builder: (controller) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Scaffold(
              appBar: CustomAppBar(
                onTap: () {
                  Get.back();
                },
              ),
              body: Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                    autofocus: true,
                    keyboardType: TextInputType.name,
                    hintText: 'patient name',
                    title: 'Patient Name',
                    controller: controller.patientnameController,
                    validator: (a) {
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Align(
                      heightFactor: 1.2,
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Select Gender',
                        style: context.textTheme.labelLarge
                            ?.copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                  const CustomGroupButton(),
                  SizedBox(
                    height: context.height * 0.2,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: CustomButton(
                        title: 'Confirm',
                        buttonColor: AppColors.buttonColor,
                        onPressed: () {
                          Get.toNamed(RouteNames.homeScreen);
                        }),
                  )
                ],
              ),
            ),
          );
        });
  }
}
