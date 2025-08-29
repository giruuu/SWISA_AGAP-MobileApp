import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:capstone/widgets/custom_button.dart';
import 'package:capstone/widgets/custom_textfield.dart';
import 'package:capstone/constants/app_colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _agreedToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios, color: AppColors.primaryGreen),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    const Icon(Icons.eco_outlined, color: AppColors.primaryGreen, size: 36),
                    const SizedBox(width: 8),
                    const Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryGreen,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Create an account to get started',
                    style: TextStyle(
                      color: AppColors.textColor.withOpacity(0.7),
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                _buildTextFieldWithLabel(
                  label: 'Name',
                  hint: 'fullname',
                  controller: _nameController,
                ),
                const SizedBox(height: 20),
                _buildTextFieldWithLabel(
                  label: 'Email Address or Phone Number',
                  hint: 'name@email.com',
                  controller: _emailController,
                ),
                const SizedBox(height: 20),
                _buildTextFieldWithLabel(
                  label: 'Password',
                  hint: 'Create a password',
                  controller: _passwordController,
                  isPassword: true,
                ),
                const SizedBox(height: 20),
                _buildTextFieldWithLabel(
                  label: 'Confirm Password',
                  hint: 'Confirm password',
                  controller: _confirmPasswordController,
                  isPassword: true,
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 24,
                      width: 24,
                      child: Checkbox(
                        value: _agreedToTerms,
                        onChanged: (value) {
                          setState(() {
                            _agreedToTerms = value ?? false;
                          });
                        },
                        activeColor: AppColors.primaryGreen,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          text: 'I\'ve read and agree with the ',
                          style: const TextStyle(fontSize: 14, color: AppColors.textColor),
                          children: [
                            TextSpan(
                              text: 'Terms and Conditions',
                              style: const TextStyle(
                                  color: AppColors.primaryGreen,
                                  fontWeight: FontWeight.bold
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () { /* TODO: Navigate to T&C */ },
                            ),
                            const TextSpan(text: ' and the '),
                            TextSpan(
                              text: 'Privacy Policy.',
                              style: const TextStyle(
                                  color: AppColors.primaryGreen,
                                  fontWeight: FontWeight.bold
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () { /* TODO: Navigate to Privacy Policy */ },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                CustomButton(
                  text: 'Create Account',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFieldWithLabel({
    required String label,
    required String hint,
    required TextEditingController controller,
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.textColor,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        CustomTextField(
          hintText: hint,
          controller: controller,
          isPassword: isPassword,
          // --- CHANGE IS HERE ---
          // We are telling this instance of the widget to show a border.
          hasBorder: true,
        ),
      ],
    );
  }
}