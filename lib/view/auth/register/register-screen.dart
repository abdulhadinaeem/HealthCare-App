import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/constants/app_colors.dart';
import 'package:healthcare/controller/auth_controller/register_screen_controller.dart';
import 'package:healthcare/mixin/validator.dart';
import 'package:healthcare/routes/route_names.dart';
import 'package:healthcare/view/auth/login/component/auth_screen_heading.dart';
import 'package:healthcare/view/auth/register/component/phone_number_field.dart';
import 'package:healthcare/widgets/buttons/custom_button.dart';
import 'package:healthcare/widgets/buttons/custom_text_buttons.dart';
import 'package:healthcare/widgets/input/custom_text_field.dart';

class RegisterScreen extends StatelessWidget with Validator {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterScreenController>(
      init: RegisterScreenController(),
      builder: (controller) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            backgroundColor: AppColors.secondaryColor,
            body: SingleChildScrollView(
              child: SafeArea(
                child: Form(
                  key: controller.registerKey,
                  child: Column(
                    children: [
                      const AuthScreensHeading(
                        isButtonRequired: true,
                        heading: 'Register Now!',
                        title: 'Please register to explore amazing features.',
                      ),
                      CustomTextField(
                          hintText: 'your full name',
                          title: 'Full Name',
                          controller: controller.userNameController,
                          validator: userNameValidator),
                      PhoneNumberTextField(
                        controller: controller,
                      ),
                      CustomTextField(
                          hintText: 'your email address',
                          title: 'Email Address',
                          controller: controller.emailController,
                          validator: emailValidator),
                      CustomTextField(
                          hintText: 'your password',
                          title: 'Create Password',
                          controller: controller.passwordController,
                          validator: passwordValidator),
                      Row(
                        children: [
                          Checkbox(
                            activeColor: AppColors.primaryColor,
                            fillColor: WidgetStateColor.resolveWith((states) {
                              if (states.contains(WidgetState.selected)) {
                                return AppColors.primaryColor;
                              }
                              return Colors.white;
                            }),
                            side: const BorderSide(color: Colors.white),
                            value: controller.isChecked,
                            onChanged: controller.checkOnChange,
                          ),
                          CustomTextButton(
                            title: 'I agree to all',
                            authType: 'Terms & Conditions',
                            onPressed: () {},
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomButton(
                        title: 'Continue',
                        buttonColor: AppColors.buttonColor,
                        onPressed: () async {
                          if (controller.registerKey.currentState!.validate()) {
                            controller.registerUser(context);
                          }
                        },
                      ),
                      CustomTextButton(
                        title: 'Already have an Account? ',
                        authType: 'Login',
                        onPressed: () async {
                          Get.toNamed(RouteNames.loginScreen);
                        },
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
