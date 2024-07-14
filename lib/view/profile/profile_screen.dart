import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:healthcare/constants/app_colors.dart';
import 'package:healthcare/constants/app_images.dart';
import 'package:healthcare/services/local_services/local_storage_methods.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          'User Profile',
          style: context.textTheme.displayMedium,
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: context.height * 0.1,
          ),
          Center(child: SvgPicture.asset(AppImages.profilePic)),
          Text(LocalStorageMethods.instance.getUserCurrentName() ?? ''),
        ],
      ),
    );
  }
}
