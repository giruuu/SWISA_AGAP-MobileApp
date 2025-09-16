import 'package:flutter/material.dart';
import 'package:capstone/constants/app_colors.dart';

class ClaimNowScreen extends StatefulWidget {
  const ClaimNowScreen({super.key});

  @override
  State<ClaimNowScreen> createState() => _ClaimNowScreenState();
}

class _ClaimNowScreenState extends State<ClaimNowScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Claim Grant', style: TextStyle(color: AppColors.primaryGreen)),
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
              const SizedBox(height: 16),
              _buildClaim(),
            ],
          ),
        ),
      ),
    );
  }

  // Bottom section: Status Timeline
  Widget _buildClaim() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.green350),
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // "You have been approved for the:" text
          const Text(
            'You have been approved for the:',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),

          // "Cash Grant" text
          const Text(
            'Cash Grant',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.green350,
            ),
          ),
          const SizedBox(height: 4),

          // "PHP 5,000.00" amount
          const Text(
            'PHP 5,000.00',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),

          // QR Code Placeholder
          Container(
            width: 200,
            height: 200,
            // Remove the color property
            decoration: BoxDecoration( // Use BoxDecoration to set the image
              image: const DecorationImage(
                image: AssetImage('assets/images/dogViolin.jpg'),
                fit: BoxFit.cover, // Ensures the image covers the container
              ),
              borderRadius: BorderRadius.circular(5), // If you want sharp corners, or adjust as needed
            ),
            child: const Center(
              child: Text(
                'QR Code Placeholder', // You might want to remove this text as it's now an image
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), // Adjust text style if keeping
              ),
            ),
          ),
          const SizedBox(height: 8),

          // Reference Number
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 3),
            decoration: BoxDecoration(
              color: AppColors.green350,
              borderRadius: BorderRadius.circular(25),
            ),
            child: const Text(
              'REF: 00000000000123874',
              style: TextStyle(
                color: Colors.white,
                fontSize: 8,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 24),

          // "How to claim:" title
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'How to claim:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),

          // Instructions list
          _buildInstruction('1. Visit the nearest SWISA OFFICE'),
          _buildInstruction('2. Present your QR code or Reference number'),
          _buildInstruction('3. Present 1 valid ID'),
          _buildInstruction('4. Claim your cash grant'),
          const SizedBox(height: 16),

          // Valid Until
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.warning, color: Colors.red),
              const SizedBox(width: 4),
              const Text(
                'Valid Until: 08/28/2025',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton('Save to Phone', AppColors.green350, Colors.white, () {}),
              _buildButton('Find the nearest SWISA Office', Colors.white, AppColors.green350, () {}),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildInstruction(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 4.0),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String text, Color backgroundColor, Color textColor, VoidCallback onPressed) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            foregroundColor: textColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: BorderSide(color: AppColors.green350),
            ),
            padding: const EdgeInsets.symmetric(vertical: 13),
          ),
          child: Text(text, style: TextStyle(fontSize: 10),),
        ),
      ),
    );
  }
}