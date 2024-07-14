import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:healthcare/models/appointment_data_model.dart';
import 'package:healthcare/services/auth_services/auth_services.dart';
import 'package:healthcare/services/local_services/local_storage_methods.dart';
import 'package:healthcare/services/user_services/user_services.dart';

class HomeScreenController extends GetxController {
  TextEditingController patientNameCONTROLLER = TextEditingController();
  late UserServices userServices;
  late AuthService authService;
  late Map<String, dynamic> usersData;
  RxBool isLoading = false.obs;
  String? selectedOption;
  final List<String> options = ['Kevin Backer', 'Jack', 'Mathews'];
  var userDataList = <Map<String, dynamic>>[].obs;
  var appointmentDataList = <AppointmentDataModel>[].obs;
  String userName = '';

  @override
  void onInit() async {
    super.onInit();
    userServices = UserServices();
    authService = AuthService();

    userName = LocalStorageMethods.instance.getUserCurrentName() ?? '';
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    appointmentDataList.assignAll(await userServices.getUserData());
  }

  Future<void> addAppointment(
      String childName, String gender, DateTime dateTime) async {
    bool success = await userServices.addUserData(childName, gender, dateTime);
    if (success) {
      await fetchUserData();
    }
  }
}
