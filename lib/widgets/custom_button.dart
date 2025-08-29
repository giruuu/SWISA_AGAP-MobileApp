import 'package:flutter/material.dart';
import 'package:capstone/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width; // Optional width parameter
  final Color? backgroundColor; // Optional background color
  final Color? foregroundColor; // Optional foreground color

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width, // Initialize optional width
    this.backgroundColor,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;

    // Responsive font size
    double responsiveFontSize = screenWidth * 0.04;
    responsiveFontSize = responsiveFontSize.clamp(14.0, 18.0); // Min 14, Max 18

    // Responsive vertical padding - can be linked to font size or screen height
    double responsiveVerticalPadding = responsiveFontSize * 1.1; // e.g., 110% of font size
    responsiveVerticalPadding = responsiveVerticalPadding.clamp(16.0, 22.0); // Min 16, Max 22

    // Responsive border radius
    double responsiveBorderRadius = screenWidth * 0.03;
    responsiveBorderRadius = responsiveBorderRadius.clamp(10.0, 14.0);

    return SizedBox(
      width: width ?? double.infinity, // Use provided width or full width
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primaryGreen, // Use provided or default color
          foregroundColor: foregroundColor ?? Colors.white, // Use provided or default color
          padding: EdgeInsets.symmetric(vertical: responsiveVerticalPadding),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(responsiveBorderRadius),
          ),
          elevation: 2,
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: responsiveFontSize, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
