import 'package:flutter/material.dart';
import 'package:capstone/constants/app_colors.dart';
import 'package:capstone/screens/splash/splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Set the fit size based on your UI design (e.g., iPhone X)
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          title: 'Swisa AGAP',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: AppColors.primaryMaterialColor,
            // --- THIS LINE IS CORRECTED ---
            // Changed AppColors.backgroundColor to Colors.white to avoid an error
            scaffoldBackgroundColor: Colors.white,

            // This applies the font to the whole app
            fontFamily: 'Poppins',

            textTheme: const TextTheme(
              bodyLarge: TextStyle(color: AppColors.textColor),
              bodyMedium: TextStyle(color: AppColors.textColor),
            ),
            appBarTheme: const AppBarTheme(
              elevation: 0,
              backgroundColor: Colors.transparent,
              iconTheme: IconThemeData(color: AppColors.primaryGreen),
              titleTextStyle: TextStyle(
                  color: AppColors.primaryGreen,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          home: const SplashScreen(),
        );
      },
    );
  }
}