import 'package:capstone/screens/grant_status/grant_status_denied.dart';
import 'package:flutter/material.dart';
import 'package:capstone/constants/app_colors.dart';
import 'package:capstone/screens/grant_status/grant_status_approved.dart';
import 'package:capstone/screens/grant_status/grant_status_details.dart';
import 'package:capstone/screens/grant_status/button_status.dart'; // This is the GrantTabBar

class GrantStatusScreen extends StatefulWidget {
  const GrantStatusScreen({super.key});

  @override
  _GrantStatusScreenState createState() => _GrantStatusScreenState();
}

class _GrantStatusScreenState extends State<GrantStatusScreen> {
  String _currentStatus = 'Pending';

  Widget _buildCurrentStatusContent() {
    switch (_currentStatus) {
      case 'Pending':
        return GrantStatusDetails();
      case 'Approved':
        return GrantStatusApproved();
      case 'Denied':
        return GrantStatusDenied();
      default:
        return GrantStatusDetails();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Define the tabs for this specific screen
    final grantTabs = ['Pending', 'Approved', 'Denied'];

    return Column(
      children: [
        GrantTabBar(
          tabs: grantTabs, // Pass the list of strings here
          onTabSelected: (status) {
            setState(() {
              _currentStatus = status;
            });
          },
        ),
        const SizedBox(height: 25),
        Expanded(
          child: _buildCurrentStatusContent(),
        ),
      ],
    );
  }
}