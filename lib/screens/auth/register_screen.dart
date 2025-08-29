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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Responsive padding
    final horizontalPadding = screenWidth * 0.06; // 6% of screen width
    final verticalPadding = screenHeight * 0.025; // 2.5% of screen height

    // Responsive icon sizes
    double arrowIconSize = screenWidth * 0.07;
    arrowIconSize = arrowIconSize.clamp(24.0, 32.0);
    double ecoIconSize = screenWidth * 0.09;
    ecoIconSize = ecoIconSize.clamp(32.0, 40.0);

    // Responsive font sizes
    double titleFontSize = screenWidth * 0.08;
    titleFontSize = titleFontSize.clamp(28.0, 36.0);
    double subtitleFontSize = screenWidth * 0.04;
    subtitleFontSize = subtitleFontSize.clamp(14.0, 18.0);
    double termsFontSize = screenWidth * 0.035;
    termsFontSize = termsFontSize.clamp(12.0, 15.0);


    // Responsive spacing
    double spacingSmall = screenHeight * 0.01; // For old 8
    spacingSmall = spacingSmall.clamp(6.0, 10.0);
    double spacingMedium = screenHeight * 0.025; // For old 20
    spacingMedium = spacingMedium.clamp(15.0, 25.0);
    double spacingLarge = screenHeight * 0.035; // For old 30
    spacingLarge = spacingLarge.clamp(25.0, 35.0);
    double spacingXLarge = screenHeight * 0.05; // For old 40
    spacingXLarge = spacingXLarge.clamp(35.0, 45.0);

    // Responsive checkbox size
    double checkboxSize = screenWidth * 0.06;
    checkboxSize = checkboxSize.clamp(20.0, 28.0);


    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios, color: AppColors.primaryGreen, size: arrowIconSize),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    Icon(Icons.eco_outlined, color: AppColors.primaryGreen, size: ecoIconSize),
                    SizedBox(width: spacingSmall),
                    Text(
                      'Register',
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryGreen,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: spacingSmall),
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.04), // Indent a bit
                  child: Text(
                    'Create an account to get started',
                    style: TextStyle(
                      color: AppColors.textColor.withOpacity(0.7),
                      fontSize: subtitleFontSize,
                    ),
                  ),
                ),
                SizedBox(height: spacingXLarge),
                _buildTextFieldWithLabel(
                  context, // Pass context
                  label: 'Name',
                  hint: 'fullname',
                  controller: _nameController,
                ),
                SizedBox(height: spacingMedium),
                _buildTextFieldWithLabel(
                  context, // Pass context
                  label: 'Email Address or Phone Number',
                  hint: 'name@email.com',
                  controller: _emailController,
                ),
                SizedBox(height: spacingMedium),
                _buildTextFieldWithLabel(
                  context, // Pass context
                  label: 'Password',
                  hint: 'Create a password',
                  controller: _passwordController,
                  isPassword: true,
                ),
                SizedBox(height: spacingMedium),
                _buildTextFieldWithLabel(
                  context, // Pass context
                  label: 'Confirm Password',
                  hint: 'Confirm password',
                  controller: _confirmPasswordController,
                  isPassword: true,
                ),
                SizedBox(height: spacingMedium),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: checkboxSize,
                      width: checkboxSize,
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
                    SizedBox(width: screenWidth * 0.03), // Responsive spacing
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          text: 'I\'ve read and agree with the ',
                          style: TextStyle(fontSize: termsFontSize, color: AppColors.textColor),
                          children: [
                            TextSpan(
                              text: 'Terms and Conditions',
                              style: TextStyle(
                                  color: AppColors.primaryGreen,
                                  fontWeight: FontWeight.bold,
                                  fontSize: termsFontSize // Ensure consistent font size
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () { /* TODO: Navigate to T&C */ },
                            ),
                            TextSpan(text: ' and the ', style: TextStyle(fontSize: termsFontSize)), // Ensure consistent font size
                            TextSpan(
                              text: 'Privacy Policy.',
                              style: TextStyle(
                                  color: AppColors.primaryGreen,
                                  fontWeight: FontWeight.bold,
                                  fontSize: termsFontSize // Ensure consistent font size
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
                SizedBox(height: spacingLarge),
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

  Widget _buildTextFieldWithLabel(
    BuildContext context, // Added context parameter
    {
    required String label,
    required String hint,
    required TextEditingController controller,
    bool isPassword = false,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    double labelFontSize = screenWidth * 0.035;
    labelFontSize = labelFontSize.clamp(12.0, 16.0);

    double internalSpacing = screenHeight * 0.01;
    internalSpacing = internalSpacing.clamp(6.0, 10.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.textColor,
            fontSize: labelFontSize,
          ),
        ),
        SizedBox(height: internalSpacing),
        CustomTextField(
          hintText: hint,
          controller: controller,
          isPassword: isPassword,
          hasBorder: true,
        ),
      ],
    );
  }
}
