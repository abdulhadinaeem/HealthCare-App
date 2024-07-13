import 'package:flutter/material.dart';
import 'package:healthcare/view/auth/login/component/auth_screen_heading.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          AuthScreensHeading(
              isButtonRequired: true,
              heading: 'Register Now!',
              title: 'Please register to explore amazing features.')
        ],
      ),
    );
  }
}
