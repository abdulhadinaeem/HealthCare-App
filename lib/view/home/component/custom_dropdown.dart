import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/controller/home_controller/home_screen_controller.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({super.key});

  @override
  CustomDropdownState createState() => CustomDropdownState();
}

class CustomDropdownState extends State<CustomDropdown> {
  final HomeScreenController homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: DropdownButton<String>(
        value:homeScreenController. selectedOption,
        hint: const Text('Kevin Backer'),
        icon: const Icon(Icons.arrow_drop_down),
        iconSize: 24,
        // elevation: 16,
        isExpanded: true,
        style: const TextStyle(color: Colors.black),
        dropdownColor: Colors.white,
        onChanged: (String? newValue) {
          setState(() {
          homeScreenController.  selectedOption = newValue;
          });
        },
        items:homeScreenController. options.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
