import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.hintText,
    required this.title,
    required this.controller,
    required this.validator,
    this.onChanged,
    this.obscureText,
    this.autofocus,
    this.keyboardType
  });
  TextInputType? keyboardType;
  bool? autofocus = false;
  final String hintText;
  final String title;
  bool? obscureText = false;
  String? Function(String?)? validator;
  TextEditingController controller = TextEditingController();
  void Function(String)? onChanged;
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
              title,
              style:
                  context.textTheme.labelLarge?.copyWith(color: Colors.black),
            ),
          ),
          TextFormField(
            keyboardType:keyboardType ,
            autofocus: autofocus??false,
            obscureText: obscureText ?? false,
            onChanged: onChanged,
            controller: controller,
            validator: validator,
            style: context.textTheme.labelMedium
                ?.copyWith(fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              fillColor: WidgetStateColor.resolveWith((states) {
                if (states.contains(WidgetState.focused)) {
                  return AppColors.textFieldFocusColor;
                }
                return Colors.white;
              }),
              filled: true,
              hintText: hintText,
              hintStyle: WidgetStateTextStyle.resolveWith((states) {
                if (states.contains(WidgetState.focused)) {
                  return const TextStyle(
                    fontSize: 14,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w500,
                  );
                }
                return const TextStyle(
                  fontSize: 14,
                  color: AppColors.hintTextColor,
                  fontWeight: FontWeight.w500,
                );
              }),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primaryColor),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              border: const OutlineInputBorder(
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
