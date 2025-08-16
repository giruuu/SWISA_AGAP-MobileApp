import 'package:flutter/material.dart';
import 'package:capstone/constants/app_colors.dart';
import 'package:capstone/screens/profile/profile_screen.dart';

class CustomHeader extends StatelessWidget {
  // We add a new property to control if the button is active
  final bool isProfileButtonActive;

  const CustomHeader({
    super.key,
    this.isProfileButtonActive = true, // By default, it's active
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/images/swisa-agap4.png',
          height: 40,
        ),
        const Spacer(),
        const Text('Username', style: TextStyle(color: AppColors.textColor, fontWeight: FontWeight.w500)),
        const SizedBox(width: 8),
        GestureDetector(
          // --- CHANGE IS HERE ---
          // The onTap function only works if isProfileButtonActive is true
          onTap: isProfileButtonActive
              ? () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ProfileScreen()),
            );
          }
              : null, // If false, the button is not tappable
          child: const CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.primaryGreen,
            child: Icon(Icons.person, color: Colors.white, size: 22),
          ),
        ),
      ],
    );
  }
}