import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:healthcare/constants/app_colors.dart';
import 'package:healthcare/constants/app_images.dart';
import 'package:healthcare/controller/complete_profile_controller/complete_profile_s_one_controller.dart';
import 'package:healthcare/routes/route_names.dart';
import 'package:healthcare/view/complete_profile/component/group_button.dart';
import 'package:healthcare/widgets/buttons/custom_button.dart';

class CompleteYourProfileScreenOne extends StatelessWidget {
  const CompleteYourProfileScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompleteProfileScreenOneController>(
      init: CompleteProfileScreenOneController(),
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
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    SvgPicture.asset(AppImages.addProfilePhoto),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          Align(
                            heightFactor: 1.2,
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Select Address',
                              style: context.textTheme.labelLarge
                                  ?.copyWith(color: Colors.black),
                            ),
                          ),
                          CSCPicker(
                            dropdownDecoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.white),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8))),
                            searchBarRadius: 12,
                            showStates: false,
                            showCities: false,
                            defaultCountry: CscCountry.Pakistan,
                            onCityChanged: (value) {},
                            onStateChanged: (value) {},
                            onCountryChanged: (country) {
                              controller.selectedCountry = country;
                            },
                          ),
                          Align(
                            heightFactor: 1.2,
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Add Address',
                              style: context.textTheme.labelLarge
                                  ?.copyWith(color: Colors.black),
                            ),
                          ),
                          TextFormField(
                            maxLines: 4,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.primaryColor),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          SvgPicture.asset(AppImages.addDocumentButton),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: context.height * 0.1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4, right: 4),
                      child: CustomButton(
                        title: 'Continue',
                        buttonColor: AppColors.buttonColor,
                        onPressed: () {
                          Get.offNamed(RouteNames.completeYourProfileScreenTwo);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
