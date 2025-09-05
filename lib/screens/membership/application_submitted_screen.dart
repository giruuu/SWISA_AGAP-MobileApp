import 'package:flutter/material.dart';
import 'package:capstone/constants/app_colors.dart';
import 'package:capstone/screens/home/home_screen.dart';

class ApplicationSubmittedScreen extends StatelessWidget {
  const ApplicationSubmittedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(flex: 2),
              const CircleAvatar(
                radius: 40,
                backgroundColor: AppColors.primaryGreen,
                child: Icon(Icons.check_rounded, color: Colors.white, size: 50),
              ),
              const SizedBox(height: 24),
              const Text(
                'Congratulations\nyour application have been\nsuccessfully submitted',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryGreen,
                  height: 1.3,
                ),
              ),
              const Spacer(flex: 3),
              ElevatedButton(
                onPressed: () {
                  // This will pop all screens until it gets back to the very first screen (HomeScreen)
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                        (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryGreen,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                child: const Text('Back to homescreen'),
              ),
              const Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}