import 'dart:math'; // <-- FIXED IMPORT
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:capstone/constants/app_colors.dart';
import 'package:capstone/screens/auth/login_screen.dart';
import 'package:capstone/screens/auth/signup_step2_screen.dart';

// Data model to hold user info during signup
class SignUpData {
  String firstName = '', middleName = '', lastName = '', email = '', password = '';
  String? suffix;
}

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final PageController _pageController = PageController();
  final SignUpData _signUpData = SignUpData();
  String _mockOtp = '';
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < 2) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context, currentMainStep: 1, totalMainSteps: 3),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: [
                  _Page1NameForm(
                    onNext: (firstName, middleName, lastName, suffix, email) {
                      setState(() {
                        _signUpData.firstName = firstName;
                        _signUpData.middleName = middleName;
                        _signUpData.lastName = lastName;
                        _signUpData.suffix = suffix;
                        _signUpData.email = email;
                      });
                      _nextPage();
                    },
                  ),
                  _Page2PasswordForm(
                    onNext: (password) {
                      setState(() {
                        _signUpData.password = password;
                        _mockOtp = (100000 + Random().nextInt(900000)).toString();
                        print('--- OTP SENT to ${_signUpData.email} ---');
                        print('--- Your Verification Code Is: $_mockOtp ---');
                      });
                      _nextPage();
                    },
                  ),
                  _Page3OtpForm(
                    email: _signUpData.email,
                    mockOtp: _mockOtp,
                    onEditEmail: () => _goToPage(0),
                    onVerified: () {
                      print('--- EMAIL OTP VERIFIED! ---');
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const SignUpStep2Screen()),
                      );
                    },
                  ),
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
  return Column(children: [Padding(padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0), child: Align(alignment: Alignment.centerLeft, child: IconButton(icon: const Icon(Icons.arrow_back, color: AppColors.primaryGreen, size: 28), onPressed: () => Navigator.of(context).pop()))), Padding(padding: const EdgeInsets.symmetric(horizontal: 24.0), child: Row(children: List.generate(totalMainSteps, (index) => Expanded(child: Container(margin: const EdgeInsets.symmetric(horizontal: 4.0), height: 4, decoration: BoxDecoration(color: (index < currentMainStep) ? AppColors.primaryGreen : Colors.grey[300], borderRadius: BorderRadius.circular(10)))))))]);
}

class _Page1NameForm extends StatefulWidget {
  final Function(String, String, String, String?, String) onNext;
  const _Page1NameForm({required this.onNext});

  @override
  State<_Page1NameForm> createState() => _Page1NameFormState();
}

class _Page1NameFormState extends State<_Page1NameForm> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _middleNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  String? _selectedSuffix;
  bool _hasNoMiddleName = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Image.asset('assets/images/swisa-agap4.png', height: 40),
            const SizedBox(height: 10),
            const Text('Let\'s Get Started!', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            _buildNameFields(),
            const SizedBox(height: 16),
            _buildMiddleNameField(),
            const SizedBox(height: 16),
            _buildLastNameField(),
            const SizedBox(height: 16),
            _buildEmailField(),
            const SizedBox(height: 20),
            _buildAgreementText(),
            const SizedBox(height: 20),
            _buildCreateAccountButton(),
            const SizedBox(height: 20),
            _buildOrDivider(),
            const SizedBox(height: 20),
            _buildLoginPrompt(context),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildNameFields() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _buildTextField(controller: _firstNameController, labelText: 'First Name', validator: (val) => val!.isEmpty ? ' ' : null)),
        const SizedBox(width: 10),
        SizedBox(width: 100, child: _buildSuffixDropdown())
      ],
    );
  }

  Widget _buildMiddleNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextField(controller: _middleNameController, labelText: 'Middle Name', enabled: !_hasNoMiddleName),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
                value: _hasNoMiddleName,
                onChanged: (bool? value) => setState(() {
                  _hasNoMiddleName = value ?? false;
                  if (_hasNoMiddleName) _middleNameController.clear();
                }),
                activeColor: AppColors.primaryGreen,
                visualDensity: VisualDensity.compact
            ),
            const Text('I have no middle name', style: TextStyle(color: Colors.grey, fontSize: 13))
          ],
        ),
      ],
    );
  }

  Widget _buildLastNameField() {
    return _buildTextField(controller: _lastNameController, labelText: 'Last Name', validator: (val) => val!.isEmpty ? ' ' : null);
  }

  Widget _buildEmailField() {
    return _buildTextField(controller: _emailController, labelText: 'Email Address', validator: (val) => (val!.isEmpty || !val.contains('@')) ? ' ' : null);
  }

  Widget _buildSuffixDropdown() {
    return DropdownButtonFormField<String>(
      value: _selectedSuffix,
      hint: const Text('Suffix'),
      dropdownColor: Colors.white,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.formFieldFill,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.formFieldBorder)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.formFieldBorder)),
      ),
      items: <String>['N/A', 'Jr.', 'Sr.', 'II', 'III'].map((String value) => DropdownMenuItem<String>(value: value, child: Text(value))).toList(),
      onChanged: (String? newValue) => setState(() => _selectedSuffix = newValue),
    );
  }

  Widget _buildAgreementText() {
    return Text.rich(TextSpan(style: TextStyle(fontSize: 13, color: Colors.grey[700]), children: const <TextSpan>[TextSpan(text: 'By tapping Create new account, you agree with the '), TextSpan(text: 'Terms and Conditions', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.primaryGreen)), TextSpan(text: ' and '), TextSpan(text: 'Privacy Notice', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.primaryGreen))]), textAlign: TextAlign.center);
  }

  Widget _buildCreateAccountButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              widget.onNext(
                _firstNameController.text.trim(),
                _middleNameController.text.trim(),
                _lastNameController.text.trim(),
                _selectedSuffix,
                _emailController.text.trim(),
              );
            }
          },
          style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryGreen, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), padding: const EdgeInsets.symmetric(vertical: 16), textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          child: const Text('Create new Account')
      ),
    );
  }

  Widget _buildOrDivider() {
    return const Row(children: [Expanded(child: Divider()), Padding(padding: EdgeInsets.symmetric(horizontal: 16.0), child: Text('OR', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold))), Expanded(child: Divider())]);
  }

  Widget _buildLoginPrompt(BuildContext context) {
    return Center(
        child: Column(children: [const Text('Already have an SwisaAGAP account?', style: TextStyle(fontSize: 15)), const SizedBox(height: 12), SizedBox(width: double.infinity, child: OutlinedButton(onPressed: () => Navigator.of(context).pop(), style: OutlinedButton.styleFrom(foregroundColor: AppColors.primaryGreen, side: const BorderSide(color: AppColors.primaryGreen, width: 2), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), padding: const EdgeInsets.symmetric(vertical: 16), textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), child: const Text('Login Here')))])
    );
  }
}

// --- PAGE 2: PASSWORD ---
class _Page2PasswordForm extends StatefulWidget {
  final Function(String) onNext;
  const _Page2PasswordForm({required this.onNext});

  @override
  State<_Page2PasswordForm> createState() => _Page2PasswordFormState();
}

class _Page2PasswordFormState extends State<_Page2PasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            const Text('Enter your password', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 30),
            _buildTextField(controller: _passwordController, labelText: 'Password', isPassword: true, validator: (val) => (val!.length < 6) ? ' ' : null),
            const SizedBox(height: 16),
            _buildTextField(controller: _confirmPasswordController, labelText: 'Confirm Password', isPassword: true, validator: (val) => (val! != _passwordController.text) ? ' ' : null),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    widget.onNext(_passwordController.text);
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryGreen, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), padding: const EdgeInsets.symmetric(vertical: 16), textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                child: const Text('Next'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- PAGE 3: OTP ---
class _Page3OtpForm extends StatelessWidget {
  final String email;
  final String mockOtp;
  final VoidCallback onEditEmail;
  final VoidCallback onVerified;

  const _Page3OtpForm({required this.email, required this.mockOtp, required this.onEditEmail, required this.onVerified});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _otpController = TextEditingController();

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            const Text('One-Time Code sent', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text.rich(TextSpan(style: const TextStyle(fontSize: 16, color: Colors.grey), children: [const TextSpan(text: 'We\'ve sent an email to '), TextSpan(text: email, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)), const TextSpan(text: ' containing a 6-digit code.')])),
            const SizedBox(height: 30),
            _buildTextField(controller: _otpController, labelText: '6-digit code', validator: (val) => (val! != mockOtp) ? ' ' : null),
            const SizedBox(height: 8),
            const Align(alignment: Alignment.centerRight, child: Text('Resend code in 02:59 seconds.', style: TextStyle(color: Colors.grey, fontSize: 13))),
            const SizedBox(height: 20),
            _buildInfoBox(),
            const SizedBox(height: 40),
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () { if (_formKey.currentState!.validate()) { onVerified(); } }, style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryGreen, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), padding: const EdgeInsets.symmetric(vertical: 16), textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), child: const Text('Next'))),
            const SizedBox(height: 40),
            Center(child: Text('Didn\'t receive the email?', style: TextStyle(fontSize: 14, color: Colors.grey[700]))),
            Center(child: Text('Try checking the your junk or spam folders', style: TextStyle(fontSize: 14, color: Colors.grey[700]))),
            const SizedBox(height: 20),
            Center(child: Text.rich(TextSpan(style: const TextStyle(fontSize: 14), children: [const TextSpan(text: 'Not ', style: TextStyle(color: Colors.grey)), TextSpan(text: email, style: const TextStyle(fontWeight: FontWeight.bold)), const TextSpan(text: '? ', style: TextStyle(color: Colors.grey)), TextSpan(text: 'Edit email here', style: const TextStyle(color: AppColors.primaryGreen, fontWeight: FontWeight.bold, decoration: TextDecoration.underline), recognizer: TapGestureRecognizer()..onTap = onEditEmail)]))),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// --- SHARED HELPER WIDGETS FOR FORMS ---
Widget _buildTextField({required String labelText, bool enabled = true, bool isPassword = false, TextEditingController? controller, String? Function(String?)? validator}) {
  return TextFormField(
    controller: controller,
    enabled: enabled,
    obscureText: isPassword,
    validator: validator,
    autovalidateMode: AutovalidateMode.disabled,
    decoration: InputDecoration(
      labelText: labelText,
      floatingLabelStyle: const TextStyle(color: AppColors.primaryGreen),
      errorStyle: const TextStyle(fontSize: 0.01, height: 0),
      suffixIcon: isPassword ? const Icon(Icons.visibility_off_outlined, color: Colors.grey) : null,
      filled: true,
      fillColor: enabled ? AppColors.formFieldFill : Colors.grey.shade200,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.formFieldBorder)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.formFieldBorder)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.focusedBorderColor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red, width: 2.5),
      ),
    ),
  );
}

Widget _buildInfoBox() {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(color: AppColors.primaryGreen.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
    child: Row(children: [Icon(Icons.info_outline, color: AppColors.primaryGreen.withOpacity(0.8)), const SizedBox(width: 12), const Expanded(child: Text.rich(TextSpan(style: TextStyle(color: Colors.black54), children: [TextSpan(text: 'Kindly wait for at least '), TextSpan(text: '2 minutes', style: TextStyle(fontWeight: FontWeight.bold)), TextSpan(text: ' for your 6-digit code to arrive. Sometimes there may be delays when receiving it. Thank you for your patience!')])))]),
  );
}