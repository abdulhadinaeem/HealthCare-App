import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:healthcare/constants/app_colors.dart';
import 'package:healthcare/constants/app_images.dart';
import 'package:healthcare/controller/login_screen_controller.dart';
import 'package:healthcare/view/auth/login/component/auth_screen_heading.dart';
import 'package:healthcare/widgets/buttons/custom_button.dart';
import 'package:healthcare/widgets/buttons/custom_text_buttons.dart';
import 'package:healthcare/widgets/input/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginScreenController>(
      init: LoginScreenController(),
      builder: (controller) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            backgroundColor: AppColors.secondaryColor,
            body: SingleChildScrollView(
              child: SafeArea(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: context.height * 0.05,
                      ),
                      const AuthScreensHeading(
                        isButtonRequired: true,
                        heading: 'Welcome Back!',
                        title: 'Please enter your credentials to login.',
                      ),
                      const CustomTextField(
                        title: 'Email/PhoneNumber',
                        hintText: 'your email/phone number',
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const CustomTextField(
                        title: 'Password',
                        hintText: 'your password',
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forget password?',
                            style: context.textTheme.labelSmall
                                ?.copyWith(color: AppColors.primaryColor),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: context.height * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            activeColor: AppColors.primaryColor,
                            fillColor: MaterialStateColor.resolveWith((states) {
                              if (states.contains(MaterialState.selected)) {
                                return AppColors.primaryColor;
                              }
                              return Colors.white;
                            }),
                            side: const BorderSide(color: Colors.white),
                            value: controller.isChecked,
                            onChanged: controller.checkOnChange,
                          ),
                          Text(
                            'Remember me',
                            style: context.textTheme.labelSmall,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomButton(
                          title: 'Login',
                          buttonColor: AppColors.buttonColor,
                          onPressed: () {
                            Get.offNamed('');
                          }),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextButton(
                        title: "Don’t have an Account? ",
                        authType: 'Register',
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
