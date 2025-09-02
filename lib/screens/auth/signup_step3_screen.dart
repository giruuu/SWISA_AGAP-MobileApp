import 'package:flutter/material.dart';
import 'package:capstone/constants/app_colors.dart';
import 'package:capstone/screens/auth/created_account_screen.dart'; // We will create this next

class SignUpStep3Screen extends StatefulWidget {
  const SignUpStep3Screen({super.key});

  @override
  State<SignUpStep3Screen> createState() => _SignUpStep3ScreenState();
}

class _SignUpStep3ScreenState extends State<SignUpStep3Screen> {
  final PageController _pageController = PageController();

  void _nextPage() {
    if (_pageController.page!.toInt() < 1) {
      _pageController.animateToPage(
        _pageController.page!.toInt() + 1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context, currentMainStep: 3, totalMainSteps: 3),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _Page1CreateMpin(onNext: _nextPage),
                  _Page2ConfirmMpin(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- SHARED WIDGETS AND PAGE BUILDERS ---

Widget _buildAppBar(BuildContext context, {required int currentMainStep, required int totalMainSteps}) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.primaryGreen, size: 28),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Row(
          children: List.generate(totalMainSteps, (index) => Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              height: 4,
              decoration: BoxDecoration(
                color: (index < currentMainStep) ? AppColors.primaryGreen : Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          )),
        ),
      ),
    ],
  );
}

Widget _buildMpinFieldRow() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: List.generate(6, (index) =>
        SizedBox(
          width: 45,
          height: 45,
          child: TextField(
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            decoration: InputDecoration(
              counterText: '',
              filled: true,
              fillColor: AppColors.formFieldFill,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: AppColors.formFieldBorder)),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: AppColors.formFieldBorder)),
            ),
          ),
        )
    ),
  );
}


// --- PAGE 1: CREATE MPIN ---
class _Page1CreateMpin extends StatelessWidget {
  final VoidCallback onNext;
  const _Page1CreateMpin({required this.onNext});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          const Text('Enter MPIN', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('Create MPIN for account security', style: TextStyle(fontSize: 16, color: Colors.grey)),
          const SizedBox(height: 8),
          const Text('Enter 6 digit MPIN for your account', style: TextStyle(fontSize: 16, color: Colors.grey)),
          const SizedBox(height: 30),
          _buildMpinFieldRow(),
          const SizedBox(height: 40),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onNext,
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryGreen, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), padding: const EdgeInsets.symmetric(vertical: 16), textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              child: const Text('Enter'),
            ),
          ),
        ],
      ),
    );
  }
}

// --- PAGE 2: CONFIRM MPIN ---
class _Page2ConfirmMpin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          const Text('Confirm MPIN again', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('Enter your MPIN for confirmation', style: TextStyle(fontSize: 16, color: Colors.grey)),
          const SizedBox(height: 8),
          const Text('Enter 6 digit MPIN for your account', style: TextStyle(fontSize: 16, color: Colors.grey)),
          const SizedBox(height: 30),
          _buildMpinFieldRow(),
          const SizedBox(height: 40),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // After final confirmation, navigate to the "Created Account" screen
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const CreatedAccountScreen()),
                        (route) => false
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryGreen, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), padding: const EdgeInsets.symmetric(vertical: 16), textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              child: const Text('Enter'),
            ),
          ),
        ],
      ),
    );
  }
}