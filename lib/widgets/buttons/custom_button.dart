import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.title,
      required this.buttonColor,
      required this.onPressed});
  final String title;
  final Color buttonColor;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: MaterialButton(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        minWidth: double.infinity,
        height: 50,
        color: buttonColor,
        onPressed: onPressed,
        child: Text(
          title,
          style: context.textTheme.labelLarge,
        ),
      ),
    );
  }
}
