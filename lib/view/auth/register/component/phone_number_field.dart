import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/constants/app_colors.dart';
import 'package:healthcare/controller/auth_controller/register_screen_controller.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneNumberTextField extends StatelessWidget {
  const PhoneNumberTextField({
    super.key,
    required this.controller
  });
  final RegisterScreenController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          Align(
            heightFactor: 1.2,
            alignment: Alignment.topLeft,
            child: Text(
              'Phone Number',
              style:
                  context.textTheme.labelLarge?.copyWith(color: Colors.black),
            ),
          ),
          IntlPhoneField(
            controller: controller.phoneNumberController,
            disableLengthCheck: true,
            dropdownTextStyle: context.textTheme.labelMedium
                ?.copyWith(fontWeight: FontWeight.w500),
            style: context.textTheme.labelMedium
                ?.copyWith(fontWeight: FontWeight.w500),
            decoration: const InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: '3456364646',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primaryColor),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
