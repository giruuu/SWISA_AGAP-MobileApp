import 'package:capstone/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:capstone/screens/grant_status/grant_status_claim.dart';

class GrantStatusDenied extends StatefulWidget {
  @override
  _GrantStatusDeniedState createState() => _GrantStatusDeniedState();
}

class _GrantStatusDeniedState extends State<GrantStatusDenied> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(5, (index) {
            return Container(
              margin: const EdgeInsets.all(7),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), spreadRadius: 2, offset: Offset(0, 4), blurRadius: 4),]
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left side: Cash Grant icon
                  _buildIconSection(),
                  const SizedBox(width: 13),
                  // Middle section: Grant details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildDetailRow('NAME:', 'PETER GRIFFIN'),
                        _buildDetailRow('DATE:', 'MAY 30, 2025'),
                        _buildDetailRow('AMOUNT:', 'PHP 5000.00'),
                        _buildDetailRow('REASON: ', 'INCORRECT DOCUMENTS'),
                      ],
                    ),
                  ),
                  // Right side: Applicants count and Apply Now button
                  const SizedBox(width: 4),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(height: 80),
                      _buildViewButton()
                    ],
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  // A helper method for the left-side icon and text.
  Widget _buildIconSection() {
    return Container(
      width: 93,
      height: 127,
      decoration: BoxDecoration(
        color: AppColors.primaryMaterialColor[350],
        borderRadius: BorderRadius.circular(7),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.assignment_turned_in, color: Colors.white, size: 40),
          SizedBox(height: 10),
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





  Widget _buildViewButton() {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const ClaimNowScreen()),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.view,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),

      ),
      child: Text(
        'VIEW DETAILS',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 10),
      ),
    );
  }

  // A helper method for the detail rows, as provided in the target code.
  Widget _buildDetailRow(String label, String value) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(fontSize: 7, color: Colors.black, height: 4),
        children: [
          TextSpan(text: '$label ', style: const TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: value),
        ],
      ),
    );
  }
}