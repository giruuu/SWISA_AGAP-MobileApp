import 'package:flutter/material.dart';
import 'package:capstone/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool isPassword;
  final bool hasBorder; // Our new property
  final IconData? prefixIcon;
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.isPassword = false,
    this.hasBorder = false, // Default is false (borderless)
    this.prefixIcon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: AppColors.hintColor),
        prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: AppColors.hintColor) : null,
        suffixIcon: isPassword
            ? const Icon(Icons.visibility_off_outlined, color: AppColors.hintColor)
            : null,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0),
        // This is the default border style
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: hasBorder
              ? const BorderSide(color: Colors.black, width: 1.0)
              : BorderSide.none,
        ),
        // This is the style when the field is enabled but not focused
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          // --- CHANGE IS HERE ---
          // We use our new `hasBorder` property to decide the style
          borderSide: hasBorder
              ? const BorderSide(color: Colors.black, width: 1.0)
              : BorderSide.none,
        ),
        // This style for the focused field remains the same
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: AppColors.primaryGreen, width: 2.5),
        ),
      ),
    );
  }
}