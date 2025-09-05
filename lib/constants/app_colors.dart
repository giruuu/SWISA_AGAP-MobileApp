import 'package:flutter/material.dart';

class AppColors {
  // --- Primary Colors ---
  static const Color primaryGreen = Color(0xFF2C6E49);
  static const Color green350 = Color(0xFF4C956C);
  static const Color accentYellow = Color(0xFFF9D423);

  // --- UI Component Colors ---
  static const Color splashBackground = Color(0xFFE0F2E9);
  static const Color lightGreen = Color(0xFFE5F2E6);
  static const Color applyButtonGreen = Color(0xFF4C956C);
  static const Color fileButtonColor = Color(0xFF68B2AB);
  static const Color view = Color(0xFFE3EDF9);
  static const Color cardBackground = Color(0xFFF5F5F5);

  // --- Text & Form Field Colors ---
  static const Color textColor = Color(0xFF333333);
  static const Color hintColor = Colors.grey;
  static const Color formFieldFill = Color(0xFFF0F7F6);
  static const Color formFieldBorder = Color(0xFFD6E9E6);
  static const Color focusedBorderColor = Color(0xFF3F861E);
  static const Color textFieldBorder = Color(0xFFE0E0E0); // Duplicate removed
  static const Color grantCardBorder = Color(0xFF3F861E);
  static const Color grey = Color(0xFFC2C2C2);


  // --- Material Color Swatch for Themes ---
  static const MaterialColor primaryMaterialColor = MaterialColor(
    0xFF2C6E49,
    <int, Color>{
      50: Color(0xFFE5ECE8),
      100: Color(0xFFBED1C5),
      200: Color(0xFF94B3A0),
      250: Color(0xFF3F861E),
      300: Color(0xFF6A957B),
      350: Color(0xFF4C956C),
      400: Color(0xFF4A7E5E),
      500: Color(0xFF2C6E49),
      600: Color(0xFF276642),
      700: Color(0xFF215B3A),
      800: Color(0xFF1B5132),
      900: Color(0xFF103F23),
    },
  );
}