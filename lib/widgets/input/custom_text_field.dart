import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.title,
  });
  final String hintText;
  final String title;

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
            decoration: InputDecoration(
              fillColor: MaterialStateColor.resolveWith((states) {
                if (states.contains(MaterialState.focused)) {
                  return AppColors.textFieldFocusColor;
                }
                return Colors.white;
              }),
              filled: true,
              hintText: hintText,
              hintStyle: MaterialStateTextStyle.resolveWith((states) {
                if (states.contains(MaterialState.focused)) {
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
