// In grant_status.dart

import 'package:capstone/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'grant_status_screen.dart'; // Import the main screen with tabs

class GrantStatus extends StatelessWidget {
  const GrantStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        title: Text(
          'Grant Status',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryMaterialColor[300],
            fontFamily: 'Poppins'
          ),
        ),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(height: 45), Expanded(child: GrantStatusScreen(),),
          ],
        ), // This is the main widget for your tabbed UI
      ),
    );
  }
}