import 'package:get/get_state_manager/get_state_manager.dart';

class LoginScreenController extends GetxController {
  bool isChecked = false;
  checkOnChange(value) {
    isChecked = value;
    update();
  }
}