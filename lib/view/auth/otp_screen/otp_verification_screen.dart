import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/constants/app_colors.dart';
import 'package:healthcare/controller/auth_controller/otp_verification_controller.dart';
import 'package:healthcare/mixin/validator.dart';
import 'package:healthcare/routes/route_names.dart';
import 'package:healthcare/view/auth/login/component/auth_screen_heading.dart';
import 'package:healthcare/widgets/buttons/custom_button.dart';
import 'package:healthcare/widgets/buttons/custom_text_buttons.dart';
import 'package:healthcare/widgets/dialog/verification_complete_dialog.dart';
import 'package:pinput/pinput.dart';

class OtpVerificationScreen extends StatelessWidget with Validator {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OtpVerificationControler>(
        init: OtpVerificationControler(),
        builder: (controller) {
          return SafeArea(
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Scaffold(
                backgroundColor: AppColors.secondaryColor,
                body: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      const AuthScreensHeading(
                        heading: 'OTP Verification',
                        title:
                            'We have sent a verification code to your phone number +54 ********* 6',
                        isButtonRequired: false,
                      ),
                      Pinput(
                        length: 4,
                        validator: validatePin,
                        controller: controller.pinCodeController,
                        keyboardAppearance: Brightness.light,
                        keyboardType: TextInputType.phone,
                        disabledPinTheme: PinTheme(
                          decoration: BoxDecoration(
                            color: AppColors.disableColorTextField,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                        ),
                        defaultPinTheme: const PinTheme(
                          height: 56,
                          width: 56,
                          textStyle: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryColor,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: context.height * 0.2,
                      ),
                      CustomTextButton(
                        title: 'Didn’t receive code?',
                        authType: 'Resend code',
                        onPressed: () {},
                      ),
                      CustomButton(
                        title: 'Confirm',
                        buttonColor: AppColors.buttonColor,
                        onPressed: () {
                          log('message');
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CustomDialog(
                                buttonTitle: 'Done',
                                heading: 'Verification Complete!',
                                onPressed: () {
                                  Get.offNamed(
                                      RouteNames.completeYourProfileScreenOne);
                                },
                                subHeading:
                                    'Thanks for your patience. Enjoy the all features of app',
                              );
                            },
                          );
                          //   if (controller.formKey.currentState!.validate()) {}
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
