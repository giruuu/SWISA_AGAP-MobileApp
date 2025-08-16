import 'package:flutter/material.dart';
import 'package:capstone/constants/app_colors.dart';
import 'package:capstone/screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swisa AGAP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: AppColors.primaryMaterialColor,
        scaffoldBackgroundColor: AppColors.backgroundColor,

        // ITO ANG NAG-AAPPLY NG FONT SA BUONG APP
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
  }
}