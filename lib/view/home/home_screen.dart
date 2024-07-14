import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:healthcare/constants/app_colors.dart';
import 'package:healthcare/constants/app_images.dart';
import 'package:healthcare/controller/home_controller/home_screen_controller.dart';
import 'package:healthcare/models/appointment_data_model.dart';
import 'package:healthcare/view/home/component/custom_bottom_sheet.dart';
import 'package:healthcare/widgets/buttons/custom_button.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
        init: HomeScreenController(),
        builder: (controller) {
          return Scaffold(
            body: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: context.height * 0.07, left: 12, right: 12),
                  height: context.height * 0.33,
                  alignment: Alignment.topCenter,
                  color: AppColors.primaryColor,
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: SvgPicture.asset(AppImages.hiIcon)),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Hey ${controller.userName},',
                              style: context.textTheme.bodyLarge,
                            ),
                            SvgPicture.asset(AppImages.bellIcon)
                          ],
                        ),
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'How can we help you today?',
                            style: context.textTheme.bodyMedium,
                          )),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomButton(
                          title: 'Seek care now',
                          buttonColor: AppColors.buttonColor,
                          onPressed: () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                              ),
                              builder: (context) {
                                return FractionallySizedBox(
                                  heightFactor: 0.5,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(20),
                                    ),
                                    child: CustomBottomSheet(
                                      controller:
                                          controller.patientNameCONTROLLER,
                                    ),
                                  ),
                                );
                              },
                            );
                          }),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Align(
                    heightFactor: 1.2,
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Your Appointments',
                      style: context.textTheme.labelLarge
                          ?.copyWith(color: Colors.black),
                    ),
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    height: context.height * 0.13,
                    child: controller.appointmentDataList.isEmpty
                        ? Center(
                            child: Text(
                              'No Appointments Yet.',
                              style: context.textTheme.labelLarge,
                            ),
                          )
                        : Obx(
                          ()=> ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.appointmentDataList.length,
                              itemBuilder: (_, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 12),
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    width: context.width * 0.8,
                                    height: context.height * 0.12,
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(8))),
                                    child: AppointmentContainer(
                                      appointmentDataList:
                                          controller.appointmentDataList,
                                      index: index,
                                    ),
                                  ),
                                );
                              }),
                        ),
                  ),
                ),
                const CustomExpansionTile(
                  title: 'What is Healthcare?',
                  content:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
                ),
                const CustomExpansionTile(
                  title: 'Lorem Ipsum Dolor',
                  content:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
                ),
              ],
            ),
          );
        });
  }
}

class AppointmentContainer extends StatelessWidget {
  const AppointmentContainer(
      {super.key, required this.appointmentDataList, required this.index});
  final List<AppointmentDataModel> appointmentDataList;
  final int index;
  @override
  Widget build(BuildContext context) {
    DateTime dateTime =
        appointmentDataList[index].dateTime?.toDate() ?? DateTime.now();

    String formattedDate = DateFormat('MMMM d, yyyy - h:mm a').format(dateTime);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(AppImages.timerIcon),
            const SizedBox(width: 8),
            Text(
              'You are number 23 in queue.',
              style: context.textTheme.labelLarge
                  ?.copyWith(color: AppColors.primaryColor),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          'Please wait for your call.',
          style: context.textTheme.labelSmall?.copyWith(fontSize: 12),
        ),
        const SizedBox(height: 4),
        Text(
          formattedDate,
          style: context.textTheme.labelLarge
              ?.copyWith(color: AppColors.primaryColor),
        ),
      ],
    );
  }
}

class CustomExpansionTile extends StatelessWidget {
  final String title;
  final String content;

  const CustomExpansionTile({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(8.0),
      child: ExpansionTile(
        collapsedShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        collapsedBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
        title: Text(
          title,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              content,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
        ],
      ),
    );
  }
}
