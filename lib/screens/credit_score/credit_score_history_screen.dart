import 'package:flutter/material.dart';
import 'package:capstone/constants/app_colors.dart';

class CreditScoreHistoryScreen extends StatelessWidget {
  const CreditScoreHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SwisaAGAP'),
        actions: [
          Row(
            children: [
              const Text('Username', style: TextStyle(color: AppColors.textColor)),
              const SizedBox(width: 8),
              IconButton(
                icon: const CircleAvatar(
                  backgroundColor: AppColors.primaryGreen,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text('Credit Score History', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Card(
                color: AppColors.lightGreen,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: AppColors.primaryGreen.withOpacity(0.5))
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Credit Score', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      Text.rich(
                          TextSpan(
                              text: '70',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.primaryGreen),
                              children: [
                                TextSpan(
                                  text: '/100',
                                  style: TextStyle(fontSize: 14, color: AppColors.hintColor),
                                ),
                              ]
                          )
                      )
                    ],
                  ),
                )
            ),
            const SizedBox(height: 24),
            Expanded(
                child: ListView(
                  children: [
                    _buildHistoryItem('General Assembly', '17 Sep 2025 - 11:20 AM', '-10 credits', Colors.red),
                    _buildHistoryItem('General Assembly', '17 Sep 2025 - 11:20 AM', '-10 credits', Colors.red),
                    _buildHistoryItem('General Assembly', '17 Sep 2025 - 11:20 AM', '-10 credits', Colors.red),
                    // Add more history items here
                  ],
                )
            )
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryItem(String title, String subtitle, String amount, Color amountColor) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 1,
      child: ListTile(
        leading: const Icon(Icons.groups, color: AppColors.primaryGreen),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: Text(amount, style: TextStyle(color: amountColor, fontWeight: FontWeight.bold)),
      ),
    );
  }
}