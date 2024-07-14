import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/constants/app_colors.dart';
import 'package:healthcare/constants/app_images.dart';
import 'package:healthcare/widgets/buttons/custom_button.dart';

class CustomDialog extends StatelessWidget {
  CustomDialog(
      {super.key,
      required this.onPressed,
      required this.heading,
      required this.subHeading,
      required this.buttonTitle});
  void Function() onPressed;
  String heading;
  String subHeading;
  String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: Colors.white,
      content: Container(
        width: 286,
        height: context.height * 0.45,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.verificationCompleteImage,
              // width: 100,
              // height: 100,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 16),
            Text(
              heading,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              subHeading,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 18),
            CustomButton(
              title: buttonTitle,
              buttonColor: AppColors.buttonColor,
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
