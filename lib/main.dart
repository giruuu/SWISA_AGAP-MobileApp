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
    final screenWidth = MediaQuery.of(context).size.width;

    // Responsive AppBar Title Font Size
    double appBarTitleFontSize = 20.0; // Default
    if (screenWidth < 360) { // For very small screens
      appBarTitleFontSize = 18.0;
    } else if (screenWidth > 720) { // For larger screens/tablets in portrait
      appBarTitleFontSize = 22.0;
    }
    // You can add more breakpoints if needed

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
        appBarTheme: AppBarTheme( // Made this non-const to allow dynamic fontSize
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: AppColors.primaryGreen), // Kept const where possible
          titleTextStyle: TextStyle(
              color: AppColors.primaryGreen,
              fontSize: appBarTitleFontSize, // Use responsive font size
              fontWeight: FontWeight.bold),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
