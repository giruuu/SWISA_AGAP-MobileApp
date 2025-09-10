import 'package:flutter/material.dart';
import 'package:capstone/constants/app_colors.dart';
import 'package:capstone/screens/grant_status/grant_status_screen.dart';

class GrantStatus extends StatelessWidget {
  const GrantStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        scrolledUnderElevation: 0.0, // This removes the shadow on scroll
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primaryGreen),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Grant Status',
          style: TextStyle(
            color: AppColors.primaryGreen,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const GrantStatusScreen(),
    );
  }
}