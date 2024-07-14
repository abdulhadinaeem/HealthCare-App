import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/widgets/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:healthcare/widgets/bottom_nav_bar/bottom_nav_bar_controller.dart';
import 'package:healthcare/view/home/home_screen.dart';
import 'package:healthcare/view/chat/chat_screen.dart';
import 'package:healthcare/view/profile/profile_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavController bottomNavController = Get.put(BottomNavController());

    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: bottomNavController.currentIndex.value,
          children: const [
            HomeScreen(),
            ChatScreen(),
            ProfileScreen(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
