import 'package:flutter/material.dart';
import 'dart:async';
import 'package:capstone/constants/app_colors.dart';
import 'package:capstone/screens/auth/login_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if (mounted) { // Check if the widget is still in the tree
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const LoginScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(color: AppColors.splashBackground),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: SplashScreenCurveClipper(),
              child: Container(
                height: screenHeight * 0.5, // Already responsive
                color: Colors.white,
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: Column(
                children: [
                  const Spacer(flex: 2),
                  _buildMainLogo(context), // Pass context
                  const Spacer(flex: 3),
                  _buildPoweredBy(context), // Pass context
                  const Spacer(flex: 1),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainLogo(BuildContext context) { // Added context
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    double logoRadius = screenWidth * 0.18;
    logoRadius = logoRadius.clamp(60.0, 90.0);

    double titleFontSize = screenWidth * 0.08;
    titleFontSize = titleFontSize.clamp(28.0, 36.0);

    double spacing = screenHeight * 0.02;
    spacing = spacing.clamp(12.0, 20.0);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: logoRadius,
          backgroundColor: Colors.transparent,
          backgroundImage: const AssetImage('assets/images/swisa_logo.png'),
        ),
        SizedBox(height: spacing),
        Text(
          'SWISA',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: titleFontSize,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryGreen,
            height: 1.0,
          ),
        ),
        Text(
          'AGAP',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: titleFontSize,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryGreen,
            height: 1.0,
          ),
        ),
      ],
    );
  }

  Widget _buildPoweredBy(BuildContext context) { // Added context
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    double poweredByFontSize = screenWidth * 0.03;
    poweredByFontSize = poweredByFontSize.clamp(10.0, 14.0);

    double iconAvatarRadius = screenWidth * 0.06;
    iconAvatarRadius = iconAvatarRadius.clamp(20.0, 30.0);
    double iconSize = iconAvatarRadius * 0.9; // Icon slightly smaller than avatar radius

    double spacing = screenHeight * 0.01;
    spacing = spacing.clamp(6.0, 10.0);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'POWERED BY',
          style: TextStyle(
            fontSize: poweredByFontSize,
            color: AppColors.hintColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: spacing),
        CircleAvatar(
          radius: iconAvatarRadius,
          backgroundColor: AppColors.cardBackground,
          child: Icon(Icons.agriculture, color: AppColors.primaryGreen, size: iconSize),
        ),
      ],
    );
  }
}

class SplashScreenCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height * 0.25); 
    path.quadraticBezierTo(
        size.width / 2, 
        size.height * 0.1, 
        size.width, 
        size.height * 0.25  
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
