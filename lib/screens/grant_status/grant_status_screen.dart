import 'package:flutter/material.dart';
import 'package:capstone/constants/app_colors.dart';
import 'package:capstone/screens/grant_status/button_status.dart';
import 'package:capstone/screens/grant_status/grant_status_viewdetails.dart';
import 'package:capstone/screens/grant_status/grant_status_claim.dart';

class GrantStatusScreen extends StatefulWidget {
  const GrantStatusScreen({super.key});

  @override
  _GrantStatusScreenState createState() => _GrantStatusScreenState();
}

class _GrantStatusScreenState extends State<GrantStatusScreen> {
  String _currentStatus = 'Pending';

  // --- DUMMY DATA ---
  final List<Map<String, String>> pendingGrants = [
    {'name': 'GRANT NAME', 'status': 'Verifying Documents'},
    {'name': 'GRANT NAME', 'status': 'Submitted'},
  ];
  final List<Map<String, String>> approvedGrants = [
    {'name': 'GRANT NAME', 'status': 'Approved'},
  ];
  final List<Map<String, String>> deniedGrants = [
    {'name': 'GRANT NAME', 'status': 'Incorrect Documents'},
  ];

  List<Map<String, String>> get _currentList {
    switch (_currentStatus) {
      case 'Approved':
        return approvedGrants;
      case 'Denied':
        return deniedGrants;
      default:
        return pendingGrants;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: GrantTabBar(
            tabs: const ['Pending', 'Approved', 'Denied'],
            onTabSelected: (status) => setState(() => _currentStatus = status),
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              const SizedBox(height: 20),
              _buildFilterControls(),
              const SizedBox(height: 20),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                itemCount: _currentList.length,
                separatorBuilder: (context, index) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final grant = _currentList[index];
                  return _buildGrantStatusCard(
                    name: grant['name']!,
                    status: grant['status']!,
                    statusType: _currentStatus,
                  );
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFilterControls() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
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

  Widget _buildGrantStatusCard({
    required String name,
    required String status,
    required String statusType,
  }) {
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
          Expanded(
            child: _buildDetailsSection(
              name: name,
              status: status,
              statusType: statusType,
            ),
          ),
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
            child: Icon(Icons.check_box_outlined, color: AppColors.primaryGreen, size: 32),
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

  Widget _buildDetailsSection({
    required String name,
    required String status,
    required String statusType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name.toUpperCase(), style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w900)),
        const SizedBox(height: 15),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('GRANT TYPE:', style: TextStyle(fontSize: 9, color: Colors.black, height: 1.8)),
                      Text('DATE:', style: TextStyle(fontSize: 9, color: Colors.black, height: 1.8)),
                      Text('STATUS:', style: TextStyle(fontSize: 9, color: Colors.black, height: 1.8)),
                    ],
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('CASH', style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, height: 1.8, color: AppColors.primaryGreen)),
                        const Text('MAY 30, 2025', style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, height: 1.8, color: AppColors.primaryGreen)),
                        Text(status, style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold, height: 1.8, color: AppColors.primaryGreen)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            _buildViewButton(statusType),
          ],
        ),
      ],
    );
  }

  Widget _buildViewButton(String statusType) {
    String buttonText = 'VIEW DETAILS';
    Widget destinationScreen = const ViewDetailsScreen();

    if (statusType == 'Approved') {
      buttonText = 'CLAIM NOW';
      destinationScreen = const ClaimNowScreen();
    }

    if (statusType == 'Approved') {
      return ElevatedButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => destinationScreen)),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryGreen,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        ),
        child: Text(buttonText, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
      );
    } else {
      return OutlinedButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => destinationScreen)),
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primaryGreen,
          side: const BorderSide(color: AppColors.primaryGreen, width: 1.5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        ),
        child: Text(buttonText, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
      );
    }
  }
}