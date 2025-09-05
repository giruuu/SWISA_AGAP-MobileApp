import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:capstone/constants/app_colors.dart';

class CustomButton1 extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final bool hasBorder;

  const CustomButton1({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = AppColors.primaryGreen,
    this.width,
    this.height,
    this.borderRadius,
    this.hasBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    if (hasBorder) {
      return SizedBox(
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    } else {
      return SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            foregroundColor: Colors.white,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(12.r),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }
  }
}
