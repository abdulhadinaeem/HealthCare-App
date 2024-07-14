import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/constants/app_colors.dart';
import 'package:healthcare/controller/auth_controller/forget_password_scren_controller.dart';
import 'package:healthcare/view/auth/login/component/auth_screen_heading.dart';
import 'package:healthcare/widgets/buttons/custom_button.dart';
import 'package:healthcare/widgets/input/custom_text_field.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgetPasswordScrenController>(
      init: ForgetPasswordScrenController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.secondaryColor,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: context.height * 0.05,
                  ),
                  const AuthScreensHeading(
                    heading: 'Forget Password!',
                    title:
                        'Not a problem! Please enter your email address to change your password.',
                    isButtonRequired: false,
                  ),
                  SizedBox(
                    height: context.height * 0.05,
                  ),
                  CustomTextField(
                      hintText: 'your email address',
                      title: 'Email Address',
                      controller: controller.emailController,
                      validator: (val) {
                        return null;
                      }),
                  SizedBox(
                    height: context.height * 0.2,
                  ),
                  CustomButton(
                    title: 'Send verification link',
                    buttonColor: AppColors.buttonColor,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
