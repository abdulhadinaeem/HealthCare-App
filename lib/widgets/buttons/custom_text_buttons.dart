import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/constants/app_colors.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key,
      required this.title,
      required this.authType,
      required this.onPressed});
  final String title;
  final String authType;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title),
        TextButton(
          onPressed: onPressed,
          child: Text(
            authType,
            style: context.textTheme.labelLarge?.copyWith(
                decoration: TextDecoration.underline,
                decorationColor: AppColors.primaryColor),
          ),
        )
      ],
    );
  }
}
