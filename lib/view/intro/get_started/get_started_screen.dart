import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:healthcare/controller/get_started_screen_controller.dart';
import 'package:healthcare/routes/app_routes.dart';
import 'package:healthcare/routes/route_names.dart';
import 'package:path_provider/path_provider.dart';
import 'package:healthcare/constants/app_colors.dart';
import 'package:healthcare/constants/app_images.dart';
import 'package:healthcare/widgets/buttons/custom_button.dart';
import 'package:healthcare/widgets/buttons/custom_outline_button.dart';
import 'package:healthcare/widgets/buttons/custom_text_buttons.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetStartedScreenController>(
      init: GetStartedScreenController(context: context),
      builder: (controller) {
        return Stack(
          children: <Widget>[
            Positioned.fill(
              child: Image.asset(
                AppImages.backgroungImage,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey,
                  );
                },
              ),
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              body: Column(
                children: [
                  const Spacer(),
                  Center(
                    child: SvgPicture.asset(
                      AppImages.getstartlogoImage,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    title: 'Sign in as a Patient',
                    buttonColor: AppColors.buttonColor,
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomOutlineButton(
                    onPressed: () {},
                    title: 'Sign in as a Doctor',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextButton(
                    title: 'Already have an Account? ',
                    authType: 'Login',
                    onPressed: () {
                      Get.offNamed(RouteNames.loginScreen);
                    },
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
