import 'package:flutter/material.dart';
import 'package:capstone/constants/app_colors.dart';
import 'package:capstone/screens/grants/final_checking_screen.dart'; // <-- Import the new screen

class ApplicationFormScreen extends StatelessWidget {
  const ApplicationFormScreen({super.key});

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
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'FILL IN PERSONAL INFORMATION',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 24),
                    _buildTextField(hint: 'Full name(autofill)'),
                    const SizedBox(height: 16),
                    _buildTextField(hint: 'Address(autofill)'),
                    const SizedBox(height: 16),
                    _buildTextField(hint: 'Phone Number(autofill)'),
                    const SizedBox(height: 16),
                    _buildTextField(hint: 'Full Name of Secondary Contact(autofill)'),
                    const SizedBox(height: 16),
                    _buildTextField(hint: 'Address of Secondary Contact(autofill)'),
                    const SizedBox(height: 16),
                    _buildTextField(hint: 'Phone No. of Secondary Contact(autofill)'),
                    const SizedBox(height: 16),
                    _buildTextField(hint: 'Reason for Applying to this Grant', maxLines: 5),
                    const SizedBox(height: 30),
                    _buildBottomButtons(context), // Pass context
                  ],
                ),
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
              'Application Form',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryGreen,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 48), // Balances the IconButton
        ],
      ),
    );
  }

  Widget _buildTextField({required String hint, int maxLines = 1}) {
    return TextFormField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey[500]),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: AppColors.primaryGreen, width: 2.0),
        ),
      ),
    );
  }

  // --- BOTTOM BUTTONS UPDATED FOR NAVIGATION ---
  Widget _buildBottomButtons(BuildContext context) { // Pass context
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(), // CANCEL button goes back
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey.shade600,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
          ),
          child: const Text('CANCEL'),
        ),
        const SizedBox(width: 12),
        ElevatedButton(
          onPressed: () {
            // This is the navigation logic
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const FinalCheckingScreen()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryGreen,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
          ),
          child: const Text('NEXT'),
        ),
      ],
    );
  }
}