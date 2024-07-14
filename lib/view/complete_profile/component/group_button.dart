import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:healthcare/constants/app_colors.dart';
import 'package:healthcare/constants/app_images.dart';

class CustomGroupButton extends StatelessWidget {
  const CustomGroupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: GetBuilder<ButtonController>(
        init: ButtonController(),
        builder: (controller) {
          return Row(
            children: [
              Expanded(
                child: SelectableButton(
                  index: 0,
                  isSelected: controller.selectedIndex == 0,
                  onPressed: () => controller.selectButton(0, 'Male'),
                  image: AppImages.maleIcon,
                  text: 'Male',
                ),
              ),
              Expanded(
                child: SelectableButton(
                  index: 1,
                  isSelected: controller.selectedIndex == 1,
                  onPressed: () => controller.selectButton(1, 'Female'),
                  image: AppImages.femaleIcon,
                  text: 'Female',
                ),
              ),
              Expanded(
                child: SelectableButton(
                  index: 2,
                  isSelected: controller.selectedIndex == 2,
                  onPressed: () => controller.selectButton(2, 'Child'),
                  image: AppImages.childIcon,
                  text: 'Child',
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class ButtonController extends GetxController {
  int selectedIndex = 0;
  String selectedText = 'Male'; // Default selected text

  void selectButton(int index, String text) {
    selectedIndex = index;
    selectedText = text;
    update();
  }
}

class SelectableButton extends StatelessWidget {
  const SelectableButton({
    super.key,
    required this.index,
    required this.isSelected,
    required this.onPressed,
    required this.image,
    required this.text,
  });

  final int index;
  final bool isSelected;
  final VoidCallback onPressed;
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.31,
      child: MaterialButton(
        color: isSelected ? AppColors.groupButtonColor : Colors.white,
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              image,
              color: isSelected ? AppColors.primaryColor : Colors.black,
            ),
            const SizedBox(
              width: 2,
            ),
            Text(
              text,
              style: TextStyle(
                color: isSelected ? AppColors.primaryColor : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// AppBar...
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({super.key, required this.onTap});
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      title: Text(
        'Complete your profile',
        style: context.textTheme.displayMedium,
      ),
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.white.withOpacity(0.15),
              ),
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.05),
            ),
            child: const Center(
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      leadingWidth: 45,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
