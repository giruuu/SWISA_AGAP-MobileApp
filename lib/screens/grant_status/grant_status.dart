import 'package:flutter/material.dart';
import 'package:capstone/constants/app_colors.dart';
import 'package:capstone/screens/grant_status/grant_status_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GrantStatus extends StatelessWidget {
  const GrantStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        scrolledUnderElevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          // --- BACK BUTTON UPDATED ---
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.primaryGreen),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Grant Status',
          style: TextStyle(
            color: AppColors.primaryGreen,
            fontWeight: FontWeight.bold,
            fontSize: 22.sp,
          ),
        ),
      ),
      body: const GrantStatusScreen(),
    );
  }
}