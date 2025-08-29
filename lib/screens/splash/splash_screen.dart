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
    // Navigate to the Login Screen after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Layer 1: The light green background color fills the entire screen
          const Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(color: AppColors.splashBackground),
            ),
          ),

          // Layer 2: The white curved shape at the bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: SplashScreenCurveClipper(),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                color: Colors.white,
              ),
            ),
          ),

          // Layer 3: The content (Logos and Text)
          SafeArea(
            child: Center(
              child: Column(
                children: [
                  const Spacer(flex: 2),
                  _buildMainLogo(),
                  const Spacer(flex: 3),
                  _buildPoweredBy(),
                  const Spacer(flex: 1),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainLogo() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CircleAvatar(
          radius: 75,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/images/swisa_logo.png'),
        ),
        const SizedBox(height: 16),
        const Text(
          'SWISA',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryGreen,
            height: 1.0,
          ),
        ),
        const Text(
          'AGAP',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryGreen,
            height: 1.0,
          ),
        ),
      ],
    );
  }

  Widget _buildPoweredBy() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'POWERED BY',
          style: TextStyle(
            fontSize: 12,
            color: AppColors.hintColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        const CircleAvatar(
          radius: 25,
          backgroundColor: AppColors.cardBackground,
          child: Icon(Icons.agriculture, color: AppColors.primaryGreen),
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

    // --- ADJUSTMENT IS HERE ---
    // Changed the control point's y-value from a negative to a positive number.
    // This makes the curve much more subtle.
    path.quadraticBezierTo(
        size.width / 2, // Control point X (center)
        size.height * 0.1,  // Control point Y (A positive value flattens the curve)
        size.width,       // End point X (right side)
        size.height * 0.25  // End point Y
    );

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}