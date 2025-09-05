import 'package:flutter/material.dart';
import 'package:capstone/constants/app_colors.dart';
import 'package:capstone/screens/membership/membership_application_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildBottomBar(),
      body: Stack(
        children: [
          _buildTopGreenSection(context),
          SingleChildScrollView(
            child: Column(
              children: [
                _buildTopProfileInfo(),
                _buildBottomWhiteSection(context),
              ],
            ),
          ),

          // --- THIS IS THE BACK BUTTON ---
          // It is positioned at the top-left of the screen.
          // The onPressed callback uses Navigator.pop() to go back to the previous screen.
          Positioned(
            top: 50,
            left: 10,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopGreenSection(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      color: AppColors.primaryGreen.withOpacity(0.9),
    );
  }

  Widget _buildTopProfileInfo() {
    return Container(
      padding: const EdgeInsets.only(top: 80),
      child: const Column(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.white,
            child: Icon(Icons.person, size: 80, color: AppColors.primaryGreen),
          ),
          SizedBox(height: 12),
          Text(
            'AERON JEAD MARQUEZ',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Member No. 2142344343',
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('View ID', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              Icon(Icons.keyboard_arrow_down, color: Colors.white),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildBottomWhiteSection(BuildContext context) {
    return ClipPath(
      clipper: ProfileCurveClipper(),
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(24, 60, 24, 20),
        child: Column(
          children: [
            _buildInfoRow('LAST NAME', 'Marquez'),
            _buildInfoRow('FIRST NAME', 'Aeron Jead'),
            _buildInfoRow('MIDDLE NAME', 'Dalde'),
            _buildDoubleInfoRow('DATE OF BIRTH', '02/25/2000', 'SEX', 'Male'),
            _buildInfoRow('DATE OF REGISTRATION', 'xxxxxxxxxx'),
            _buildInfoRow('FULL ADDRESS', 'Victory, Legazpi City Albay'),
            const SizedBox(height: 30),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const MembershipApplicationScreen()),
                );
              },
              child: const Text(
                'CLICK HERE TO APPLY FOR MEMBERSHIP',
                style: TextStyle(
                  color: AppColors.primaryGreen,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          SizedBox(
            width: 150,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
          Expanded(
            child: Text(value, style: const TextStyle(fontSize: 14)),
          ),
        ],
      ),
    );
  }

  Widget _buildDoubleInfoRow(String label1, String value1, String label2, String value2) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          SizedBox(
            width: 150,
            child: Text(label1, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          ),
          Expanded(
            child: Text(value1, style: const TextStyle(fontSize: 14)),
          ),
          SizedBox(
            width: 40,
            child: Text(label2, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          ),
          Expanded(
            child: Text(value2, style: const TextStyle(fontSize: 14)),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      height: 60,
      color: AppColors.primaryGreen,
      child: const Center(
        child: Text(
          'NON MEMBER',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

class ProfileCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 30);
    path.quadraticBezierTo(size.width / 2, 0, 0, 30);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}