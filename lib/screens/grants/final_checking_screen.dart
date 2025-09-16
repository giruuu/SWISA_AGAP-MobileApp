import 'package:flutter/material.dart';
import 'package:capstone/constants/app_colors.dart';
import 'package:capstone/screens/grants/view_file_screen.dart';

class FinalCheckingScreen extends StatelessWidget {
  const FinalCheckingScreen({super.key});

  // --- NEW DIALOG WIDGET ---
  void _showSubmissionDoneDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // User must tap a button to close
      builder: (BuildContext dialogContext) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(
                  radius: 35,
                  backgroundColor: AppColors.primaryGreen,
                  child: Icon(Icons.check_rounded, color: Colors.white, size: 40),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Application Submitted',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primaryGreen), // Title color
                ),
                const SizedBox(height: 12),
                Text(
                  'We\'ve received your application and will notify you of any updates.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey[600]),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryGreen,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () {
                      // TODO: Navigate to the application status tracking screen
                      Navigator.of(dialogContext).pop();
                    },
                    child: const Text('Track Application Status'),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade600,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () {
                      // Pop all screens until we get back to the home screen
                      Navigator.of(dialogContext).popUntil((route) => route.isFirst);
                    },
                    child: const Text('Back to Home'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionTitle('FINAL CHECKING OF APPLICATION FORM'),
                    const SizedBox(height: 24),
                    _buildSectionTitle('Personal Information'),
                    const SizedBox(height: 12),
                    _buildInfoRow('Full name(autofill):', 'Juana Dela Cruz'),
                    _buildInfoRow('Address(autofill):', 'Legazpi City'),
                    _buildInfoRow('Full Name of Secondary Contact(autofill):', 'Juan Dela Cruz'),
                    _buildInfoRow('Address of Secondary Contact(autofill):', 'Legazpi City'),
                    _buildInfoRow('Phone No. of Secondary Contact(autofill):', '09123456789'),
                    const SizedBox(height: 16),
                    _buildMultiLineInfoRow(
                        'Reason for Applying to this Grant:',
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.'
                    ),
                    const SizedBox(height: 24),
                    _buildSectionTitle('Requirements'),
                    const SizedBox(height: 12),
                    _buildRequirementsList(context),
                  ],
                ),
              ),
            ),
            _buildBottomButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 16, 12, 0),
      child: Row(
        children: [
          // --- BACK BUTTON UPDATED ---
          IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: AppColors.primaryGreen),
            onPressed: () => Navigator.of(context).pop(),
          ),
          const Expanded(
            child: Text(
              'Application Form',
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

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: AppColors.primaryGreen, // Changed to primaryGreen
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text.rich(
        TextSpan(
          text: '$label ',
          style: const TextStyle(color: AppColors.primaryGreen, fontWeight: FontWeight.bold, fontSize: 12), // Changed label color to primaryGreen
          children: [
            TextSpan(
              text: value,
              style: TextStyle(fontWeight: FontWeight.normal, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMultiLineInfoRow(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: AppColors.primaryGreen, fontWeight: FontWeight.bold, fontSize: 12),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(color: Colors.grey[700], fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildRequirementsList(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _buildRequirementRow(context, 'VALID ID / GOVERMENT ID'),
          _buildRequirementRow(context, 'REQUIREMENT NO.1'),
          _buildRequirementRow(context, 'REQUIREMENT NO.1'),
          _buildRequirementRow(context, 'REQUIREMENT NO.1'),
          _buildRequirementRow(context, 'REQUIREMENT NO.1'),
        ],
      ),
    );
  }

  Widget _buildRequirementRow(BuildContext context, String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Text(name, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 12)),
          ),
          const Icon(Icons.check_circle, color: Colors.green, size: 20),
          const SizedBox(width: 8),
          const Icon(Icons.file_present_rounded, color: Colors.purple, size: 20),
          const SizedBox(width: 8),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ViewFileScreen(requirementTitle: name)),
              );
            },
            child: _buildFileActionButton('VIEW FILE', Colors.teal),
          ),
        ],
      ),
    );
  }

  Widget _buildFileActionButton(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
    );
  }

  // --- BOTTOM BUTTONS WIDGET UPDATED ---
  Widget _buildBottomButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade600,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('CANCEL'),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                // This now shows the new "Submission Done" dialog
                _showSubmissionDoneDialog(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryGreen,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('SUBMIT'),
            ),
          ),
        ],
      ),
    );
  }
}
