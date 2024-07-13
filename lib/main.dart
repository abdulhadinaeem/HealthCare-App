import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcare/constants/app_colors.dart';
import 'package:healthcare/routes/app_routes.dart';
import 'package:healthcare/routes/route_names.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
      // systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: TextTheme(
          displayLarge: GoogleFonts.urbanist(
            textStyle: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          labelLarge: GoogleFonts.urbanist(
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.buttonTextColor,
            ),
          ),
          labelMedium: GoogleFonts.urbanist(
            textStyle: const TextStyle(
              fontSize: 14,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          labelSmall: GoogleFonts.urbanist(
            textStyle: const TextStyle(
              fontSize: 14,
              color: AppColors.buttonTextColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      initialRoute: RouteNames.loginScreen,
      getPages: AppRoutes.appRoutes(),
    );
  }
}
