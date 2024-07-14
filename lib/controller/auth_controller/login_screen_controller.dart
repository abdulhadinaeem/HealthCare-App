import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LoginScreenController extends GetxController {
  bool isValidate = false;
  bool obscureText = true;
  final loginkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isChecked = false;
  checkOnChange(value) {
    isChecked = value;
    update();
  }
}
