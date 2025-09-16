import 'package:flutter/material.dart';
import 'package:capstone/constants/app_colors.dart';

class ViewDetailsScreen extends StatefulWidget {
  const ViewDetailsScreen({super.key});

  @override
  State<ViewDetailsScreen> createState() => _ViewDetailsScreenState();
}

class _ViewDetailsScreenState extends State<ViewDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Grant Status',
          style: TextStyle(color: AppColors.primaryGreen),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          // --- BACK BUTTON UPDATED ---
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.primaryGreen),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildGrantDetailsCard(),
              const SizedBox(height: 16),
              _buildStatusTimeline(),
            ],
          ),
        ),
      ),
    );
  }

  // Top section: Grant Details Card
  Widget _buildGrantDetailsCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildIconSection(), // Reuse the icon section from the previous screen
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDetailRow('TYPE OF GRANT:', 'CASH GRANT'),
                _buildDetailRow('AMOUNT:', '₱10,000.00'),
                _buildDetailRow('DATE SUBMITTED:', '08/20/2025'),
                _buildDetailRow('REFERENCE NUMBER:', '00000000000123874'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper for the icon section
  Widget _buildIconSection() {
    return Container(
      width: 90,
      height: 120,
      decoration: BoxDecoration(
        color: AppColors.primaryMaterialColor[350],
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.assignment_turned_in, color: Colors.white, size: 40),
          Text(
            'CASH\nGRANT',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // Helper for detail rows
  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 9, color: Colors.black, height: 2),
          children: [
            TextSpan(
              text: label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: ' $value'),
          ],
        ),
      ),
    );
  }

  // Bottom section: Status Timeline
  Widget _buildStatusTimeline() {
    // You'll need to create a list of status objects or just use a list of strings
    final statuses = [
      {'status': 'Application Successfully Submitted', 'description': 'Waiting for your application to be processed', 'date': '08/20/2025\n11:45 PM', 'icon': Icons.check_circle_outline},
      {'status': 'Processing your Application', 'description': 'SWISA is processing requirements', 'date': null, 'icon': Icons.sync},
      {'status': 'Waiting for Approval', 'description': 'Your application is waiting for approval', 'date': null, 'icon': Icons.pending_actions},
      {'status': 'Application Approved', 'description': 'Claim your grant', 'date': null, 'icon': Icons.account_balance_wallet_outlined},
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: List.generate(statuses.length, (index) {
          final status = statuses[index];
          final isCompleted = index == 0; // Assuming the first item is complete

          return IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  children: [
                    Icon(status['icon'] as IconData, color: isCompleted ? AppColors.primaryMaterialColor[350] : Colors.grey),
                    if (index < statuses.length - 1)
                      Expanded(
                        child: Container(
                          width: 2,
                          color: isCompleted ? AppColors.primaryMaterialColor[350] : Colors.grey,
                        ),
                      ),
                  ],
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        status['status'] as String,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isCompleted ? AppColors.primaryMaterialColor[350] : Colors.black,
                        height: 2,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        status['description'] as String,
                        style: TextStyle(
                          color: isCompleted ? AppColors.primaryMaterialColor[350] : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                if (status['date'] != null)
                  Text(
                    status['date'] as String,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: isCompleted ? AppColors.primaryMaterialColor[350] : Colors.grey,
                    ),
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }
}