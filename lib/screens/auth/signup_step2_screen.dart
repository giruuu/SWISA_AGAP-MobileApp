import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:capstone/constants/app_colors.dart';
import 'package:capstone/screens/auth/signup_step3_screen.dart';

class SignUpStep2Screen extends StatefulWidget {
  const SignUpStep2Screen({super.key});

  @override
  State<SignUpStep2Screen> createState() => _SignUpStep2ScreenState();
}

class _SignUpStep2ScreenState extends State<SignUpStep2Screen> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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
            // AppBar shows that we are on the second main step of 3
            _buildAppBar(context, currentMainStep: 2, totalMainSteps: 3),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _Page1PhoneForm(onNext: _nextPage),
                  _Page2PhoneOtpForm(onEditNumber: () => _pageController.jumpToPage(0)),
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

Widget _buildTextField({required String labelText}) {
  return TextField(
    keyboardType: TextInputType.phone,
    decoration: InputDecoration(
      labelText: labelText,
      filled: true,
      fillColor: AppColors.formFieldFill,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.formFieldBorder)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.formFieldBorder)),
    ),
  );
}

// --- PAGE 1: ENTER PHONE NUMBER ---
class _Page1PhoneForm extends StatelessWidget {
  final VoidCallback onNext;
  const _Page1PhoneForm({required this.onNext});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          const Text('Enter your phone number', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 30),
          _buildTextField(labelText: 'Phone Number'),
          const SizedBox(height: 40),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onNext,
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryGreen, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), padding: const EdgeInsets.symmetric(vertical: 16), textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              child: const Text('Next'),
            ),
          ),
        ],
      ),
    );
  }
}

// --- PAGE 2: VERIFY PHONE OTP ---
class _Page2PhoneOtpForm extends StatelessWidget {
  final VoidCallback onEditNumber;
  const _Page2PhoneOtpForm({required this.onEditNumber});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          const Text('One-Time Code sent', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text.rich(TextSpan(style: TextStyle(fontSize: 16, color: Colors.grey), children: [TextSpan(text: 'We\'ve sent an OTP to your '), TextSpan(text: '09******12', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)), TextSpan(text: ' containing a 6-digit OTP.')])),
          const SizedBox(height: 30),
          _buildTextField(labelText: '6-digit OTP'),
          const SizedBox(height: 8),
          const Align(alignment: Alignment.centerRight, child: Text('Resend code in 02:59 seconds.', style: TextStyle(color: Colors.grey, fontSize: 13))),
          const SizedBox(height: 20),
          _buildInfoBox(),
          const SizedBox(height: 40),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    // After verifying phone OTP, navigate to Step 3
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const SignUpStep3Screen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryGreen, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), padding: const EdgeInsets.symmetric(vertical: 16), textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  child: const Text('Next')
              )
          ),
          const SizedBox(height: 40),
          Center(child: Text('Didn\'t receive the code?', style: TextStyle(fontSize: 14, color: Colors.grey[700]))),
          Center(child: Text('Wait patiently or try to resend it', style: TextStyle(fontSize: 14, color: Colors.grey[700]))),
          const SizedBox(height: 20),
          Center(child: Text.rich(TextSpan(style: const TextStyle(fontSize: 14), children: [const TextSpan(text: 'Not your Number? ', style: TextStyle(color: Colors.grey)), TextSpan(text: 'Edit Number here', style: const TextStyle(color: AppColors.primaryGreen, fontWeight: FontWeight.bold, decoration: TextDecoration.underline), recognizer: TapGestureRecognizer()..onTap = onEditNumber)]))),
        ],
      ),
    );
  }
}

Widget _buildInfoBox() {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(color: AppColors.primaryGreen.withAlpha((255 * 0.1).round()), borderRadius: BorderRadius.circular(12)),
    child: Row(children: [Icon(Icons.info_outline, color: AppColors.primaryGreen.withAlpha((255 * 0.8).round())), const SizedBox(width: 12), const Expanded(child: Text.rich(TextSpan(style: TextStyle(color: Colors.black54), children: [TextSpan(text: 'Kindly wait for at least '), TextSpan(text: '3 minutes', style: TextStyle(fontWeight: FontWeight.bold)), TextSpan(text: ' for your 6-digit OTP to arrive. Sometimes there may be delays when receiving it. Thank you for your patience!')])))]),
  );
}
