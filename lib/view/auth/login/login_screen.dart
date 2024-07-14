

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/services/auth_services/auth_services.dart';
import 'package:healthcare/constants/app_colors.dart';
import 'package:healthcare/controller/auth_controller/login_screen_controller.dart';
import 'package:healthcare/mixin/validator.dart';
import 'package:healthcare/routes/route_names.dart';
import 'package:healthcare/view/auth/login/component/auth_screen_heading.dart';
import 'package:healthcare/widgets/buttons/custom_button.dart';
import 'package:healthcare/widgets/buttons/custom_text_buttons.dart';
import 'package:healthcare/widgets/input/custom_text_field.dart';

class LoginScreen extends StatelessWidget with Validator {
  LoginScreen({super.key});

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
                child: Form(
                  key: controller.loginkey,
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
                        CustomTextField(
                          validator: (p0) {
                            return null;
                          },
                          title: 'Email/PhoneNumber',
                          hintText: 'your email/phone number',
                          controller: controller.emailController,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        CustomTextField(
                          validator: passwordValidator,
                          obscureText: controller.obscureText,
                        
                          title: 'Password',
                          hintText: 'your password',
                          controller: controller.passwordController,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Get.toNamed(RouteNames.forgetScreen);
                            },
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
                            onPressed: () async {
                              if (controller.loginkey.currentState!
                                  .validate()) {
                                await AuthService()
                                    .loginUser(
                                  email: controller.emailController.text,
                                  password: controller.passwordController.text,
                                )
                                    .then((val) {
                                  Get.toNamed(RouteNames.registerScreen);
                                });
                              }
                            }),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomTextButton(
                          title: "Don’t have an Account? ",
                          authType: 'Register',
                          onPressed: () {
                            Get.toNamed(RouteNames.registerScreen);
                          },
                        ),
                      ],
                    ),
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
