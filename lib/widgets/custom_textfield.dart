import 'package:flutter/material.dart';
import 'package:capstone/constants/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final bool hasBorder;
  final IconData? prefixIcon;
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.isPassword = false,
    this.hasBorder = false,
    this.prefixIcon,
    required this.controller,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height; // Not directly used for height-based scaling of text field itself

    // Responsive font size for text and hint
    double fontSize = screenWidth * 0.04;
    fontSize = fontSize.clamp(14.0, 18.0); // Min 14, Max 18

    // Responsive padding
    double verticalPadding = screenWidth * 0.045; // Based on width to maintain aspect
    verticalPadding = verticalPadding.clamp(16.0, 20.0);
    double horizontalPadding = screenWidth * 0.05;
    horizontalPadding = horizontalPadding.clamp(18.0, 22.0);

    // Responsive icon size
    double iconSize = screenWidth * 0.055;
    iconSize = iconSize.clamp(20.0, 26.0);

    // Responsive border radius
    double borderRadiusValue = screenWidth * 0.03;
    borderRadiusValue = borderRadiusValue.clamp(10.0, 14.0);

    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      style: TextStyle(fontSize: fontSize), // Apply responsive font size to input text
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(color: AppColors.hintColor, fontSize: fontSize), // Apply to hint text
        prefixIcon: widget.prefixIcon != null
            ? Icon(widget.prefixIcon, color: AppColors.hintColor, size: iconSize) // Apply icon size
            : null,
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                  color: AppColors.hintColor,
                  size: iconSize, // Apply icon size
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(
            vertical: verticalPadding,
            horizontal: horizontalPadding,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadiusValue),
          borderSide: widget.hasBorder
              ? const BorderSide(color: Colors.black, width: 1.0)
              : BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadiusValue),
          borderSide: widget.hasBorder
              ? const BorderSide(color: Colors.black, width: 1.0)
              : BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadiusValue),
          borderSide: const BorderSide(color: AppColors.primaryGreen, width: 2.0), // Slightly thinner focused border width
        ),
      ),
    );
  }
}
