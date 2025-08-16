import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryGreen = Color(0xFF2C6E49);
  static const Color lightGreen = Color(0xFFE5F2E6);
  static const Color backgroundColor = Colors.white;
  static const Color accentYellow = Color(0xFFF9D423);
  static const Color textColor = Color(0xFF333333);
  static const Color hintColor = Colors.grey;
  static const Color cardBackground = Color(0xFFF5F5F5);
  static const Color splashBackground = Color(0xFFE0F2F1);

  // This material color swatch is also updated to match the new primaryGreen
  static const MaterialColor primaryMaterialColor = MaterialColor(
    0xFF2C6E49,
    <int, Color>{
      50: Color(0xFFE5ECE8),
      100: Color(0xFFBED1C5),
      200: Color(0xFF94B3A0),
      300: Color(0xFF6A957B),
      400: Color(0xFF4A7E5E),
      500: Color(0xFF2C6E49),
      600: Color(0xFF276642),
      700: Color(0xFF215B3A),
      800: Color(0xFF1B5132),
      900: Color(0xFF103F23),
    },
  );
}