import 'package:flutter/material.dart';
import 'package:capstone/constants/app_colors.dart';
import 'package:capstone/screens/grants/view_requirements_screen.dart'; // <-- Import for navigation

class AvailableGrantsScreen extends StatefulWidget {
  const AvailableGrantsScreen({super.key});

  @override
  State<AvailableGrantsScreen> createState() => _AvailableGrantsScreenState();
}

class _AvailableGrantsScreenState extends State<AvailableGrantsScreen> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context),
            const SizedBox(height: 20),
            _buildTabBar(context), // Pass context
            const SizedBox(height: 20),
            _buildFilterControls(),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                itemCount: 5,
                separatorBuilder: (context, index) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  return _buildGrantCard(context); // Pass context
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 16, 12, 0),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.primaryGreen, size: 28),
            onPressed: () => Navigator.of(context).pop(),
          ),
          const Expanded(
            child: Text(
              'Available Grants',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryGreen,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 48),
        ],
      ),
    );
  }

  Widget _buildTabBar(BuildContext context) { // Added context parameter
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.grey.shade300)),
        child: Row(
          children: [
            _buildTabButton(context, 'Eligible', 0), // Pass context
            _buildTabButton(context, 'Non-Eligible', 1), // Pass context
            _buildTabButton(context, 'Applied', 2), // Pass context
          ],
        ),
      ),
    );
  }

  Widget _buildTabButton(BuildContext context, String text, int index) { // Added context
    bool isSelected = _selectedTabIndex == index;
    final screenWidth = MediaQuery.of(context).size.width; // Get screen width
    double fontSize = screenWidth < 360 ? 12.0 : 14.0; // Adjust font size based on screen width

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedTabIndex = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryGreen : Colors.transparent,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey.shade600,
                fontWeight: FontWeight.bold,
                fontSize: fontSize, // Use responsive font size
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFilterControls() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.primaryGreen.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text('Grant Type', style: TextStyle(color: AppColors.primaryGreen, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 8),
          TextButton.icon(
            onPressed: () {},
            icon: Icon(Icons.filter_list, color: Colors.grey.shade600),
            label: Text('FILTER', style: TextStyle(color: Colors.grey.shade600)),
          ),
        ],
      ),
    );
  }

  Widget _buildGrantCard(BuildContext context) { // Pass context
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primaryGreen, width: 1.0),
      ),
      child: Row(
        children: [
          _buildLeftIcon(),
          const SizedBox(width: 12),
          Expanded(child: _buildDetailsSection(context)), // Pass context
        ],
      ),
    );
  }

  Widget _buildLeftIcon() {
    return Container(
      width: 90,
      height: 110,
      decoration: BoxDecoration(
        color: AppColors.primaryGreen,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.check_box_outlined,
              color: AppColors.primaryGreen,
              size: 32,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'CASH\nGRANT',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold, height: 1.2),
          )
        ],
      ),
    );
  }

  Widget _buildDetailsSection(BuildContext context) { // Pass context
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              child: Text('GRANT NAME', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            ),
            const SizedBox(width: 8),
            Row(
              children: [
                Icon(Icons.person_outline, color: AppColors.primaryGreen, size: 16),
                const SizedBox(width: 4),
                const Text('10', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.primaryGreen)),
              ],
            ),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Row(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('GRANT TYPE:', style: TextStyle(fontSize: 9, color: Colors.black, height: 1.7)),
                      Text('DATE:', style: TextStyle(fontSize: 9, color: Colors.black, height: 1.7)),
                      Text('AMOUNT:', style: TextStyle(fontSize: 9, color: Colors.black, height: 1.7)),
                      Text('APPLICANT LIMIT:', style: TextStyle(fontSize: 9, color: Colors.black, height: 1.7)),
                    ],
                  ),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('CASH', style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, height: 1.7, color: AppColors.primaryGreen)),
                        Text('MAY 30, 2025', style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, height: 1.7, color: AppColors.primaryGreen)),
                        Text('PHP 5000.00', style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, height: 1.7, color: AppColors.primaryGreen)),
                        Text('100', style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, height: 1.7, color: AppColors.primaryGreen)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            OutlinedButton(
              onPressed: () {
                // This is the navigation logic
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const ViewRequirementsScreen()),
                );
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.primaryGreen,
                side: const BorderSide(color: AppColors.primaryGreen, width: 1.5),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              ),
              child: const Text('APPLY NOW', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ],
    );
  }
}
