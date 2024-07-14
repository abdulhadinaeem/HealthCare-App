import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:healthcare/constants/app_colors.dart';
import 'package:healthcare/constants/app_images.dart';

class AuthScreensHeading extends StatelessWidget {
  const AuthScreensHeading(
      {super.key,
      required this.heading,
      required this.title,
      required this.isButtonRequired});
  final String heading;
  final String title;
  final bool isButtonRequired;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(AppImages.loginLogo),
        Text(
          heading,
          style: context.textTheme.displayLarge,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: context.textTheme.labelSmall?.copyWith(
            color: AppColors.textColor,
          ),
        ),
        isButtonRequired
            ? Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SvgPicture.asset(AppImages.googleButton),
                      SvgPicture.asset(AppImages.appleButton),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SvgPicture.asset(AppImages.dividerImg),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              )
            : const SizedBox(
                height: 16,
              ),
      ],
    );
  }
}
