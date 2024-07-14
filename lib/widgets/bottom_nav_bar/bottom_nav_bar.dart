import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:healthcare/constants/app_colors.dart';
import 'package:healthcare/constants/app_images.dart';
import 'package:healthcare/widgets/bottom_nav_bar/bottom_nav_bar_controller.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final BottomNavController bottomNavController =
      Get.put(BottomNavController());

  CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        elevation: 0,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.bottombarIconColor,
        currentIndex: bottomNavController.currentIndex.value,
        onTap: (index) => bottomNavController.changeTabIndex(index),
        items: [
          BottomNavigationBarItem(
            icon: bottomNavController.currentIndex.value == 0
                ? SvgPicture.asset(AppImages.homeSelectIcon)
                : SvgPicture.asset(AppImages.homeIcon),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: bottomNavController.currentIndex.value == 1
                ? SvgPicture.asset(AppImages.chatSelectIcon)
                : SvgPicture.asset(AppImages.chatIcon),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: bottomNavController.currentIndex.value == 2
                ? SvgPicture.asset(AppImages.profileSelectIcon)
                : SvgPicture.asset(AppImages.profileIcon),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
