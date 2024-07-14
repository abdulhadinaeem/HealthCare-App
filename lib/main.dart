import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcare/services/auth_services/auth_services.dart';
import 'package:healthcare/constants/app_colors.dart';
import 'package:healthcare/controller/home_controller/home_screen_controller.dart';
import 'package:healthcare/routes/app_routes.dart';
import 'package:healthcare/routes/route_names.dart';
import 'package:healthcare/services/local_services/prefs.dart';
import 'package:healthcare/view/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyCO1ZACjh5C05w6o-ByHw0oyBFK0Lc0dxA',
          appId: '1:1000589106548:android:7e123ec03141b505832021',
          messagingSenderId: '1000589106548',
          projectId: 'health-care-app-51ba7'));
  AuthService authService = AuthService();
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
        scaffoldBackgroundColor: AppColors.secondaryColor,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: TextTheme(
          bodyLarge: GoogleFonts.tiroKannada(
            textStyle: const TextStyle(
                fontSize: 30, fontWeight: FontWeight.w400, color: Colors.white),
          ),
          bodyMedium: GoogleFonts.urbanist(
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
       
          
          displayLarge: GoogleFonts.urbanist(
            textStyle: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          displayMedium: GoogleFonts.urbanist(
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
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
      initialRoute: RouteNames.splashScreen,
      getPages: AppRoutes.appRoutes(),
    );
  }
}

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeScreenController());
  }
}
