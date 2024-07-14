import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/services/auth_services/auth_services.dart';
import 'package:healthcare/services/local_services/local_storage_methods.dart';
import 'package:healthcare/view/auth/otp_screen/otp_verification_screen.dart';

class RegisterScreenController extends GetxController {
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final registerKey = GlobalKey<FormState>();
  bool isChecked = false;
  String? userName;
  String? email;
  String? password;
  String? phoneNumber;
  checkOnChange(value) {
    isChecked = value;
    update();
  }

  Future<void> registerUser(BuildContext context) async {
    userName = userNameController.text;
    email = emailController.text;
    password = passwordController.text;
    phoneNumber = phoneNumberController.text;
    await AuthService()
        .registerUser(
            email: email ?? '',
            password: password ?? '',
            userName: userName ?? '',
            phoneNumber: phoneNumber ?? '')
        .then(
      (val) {
        LocalStorageMethods.instance
            .writeUserCurrentName(userName??'');
        emailController.clear();
        passwordController.clear();
        userNameController.clear();
        phoneNumberController.clear();
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          builder: (context) {
            return const FractionallySizedBox(
              heightFactor: 0.9,
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                child: OtpVerificationScreen(),
              ),
            );
          },
        );
      },
    );
  }
}
