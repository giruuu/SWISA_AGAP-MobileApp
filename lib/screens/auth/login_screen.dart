import 'package:flutter/material.dart';
import 'package:capstone/screens/home/home_screen.dart';
import 'package:capstone/screens/auth/register_screen.dart';
import 'package:capstone/widgets/custom_button.dart';
import 'package:capstone/widgets/custom_textfield.dart';
import 'package:capstone/constants/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Responsive values
    double logoRadius = screenWidth * 0.15;
    if (logoRadius > 60) logoRadius = 60;
    if (logoRadius < 40) logoRadius = 40;

    double titleFontSize = screenWidth * 0.08;
    if (titleFontSize > 32) titleFontSize = 32;
    if (titleFontSize < 24) titleFontSize = 24;

    double subtitleFontSize = screenWidth * 0.045;
    if (subtitleFontSize > 16) subtitleFontSize = 16;
    if (subtitleFontSize < 13) subtitleFontSize = 13;

    double smallTextFontSize = screenWidth * 0.038;
    if (smallTextFontSize > 14) smallTextFontSize = 14;
    if (smallTextFontSize < 11) smallTextFontSize = 11;

    double mainHorizontalPadding = screenWidth * 0.06;

    double topSpacing = screenHeight * 0.08; // Adjusted from 0.1
    if (topSpacing > 80) topSpacing = 80;
    if (topSpacing < 30) topSpacing = 30;

    double generalSpacing = screenHeight * 0.025; // For spacing like 20
    if (generalSpacing > 25) generalSpacing = 25;
    if (generalSpacing < 15) generalSpacing = 15;
    
    double betweenFieldsSpacing = screenHeight * 0.022; // For spacing between text fields
     if (betweenFieldsSpacing > 20) betweenFieldsSpacing = 20;
    if (betweenFieldsSpacing < 12) betweenFieldsSpacing = 12;


    double formSectionSpacing = screenHeight * 0.04; // For spacing like 40
    if (formSectionSpacing > 40) formSectionSpacing = 40;
    if (formSectionSpacing < 25) formSectionSpacing = 25;


    return Scaffold(
      backgroundColor: AppColors.splashBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: mainHorizontalPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: topSpacing),

                CircleAvatar(
                  radius: logoRadius,
                  backgroundColor: Colors.transparent,
                  backgroundImage: const AssetImage('assets/images/swisa_logo.png'),
                ),

                SizedBox(height: generalSpacing),

                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryGreen,
                  ),
                ),

                SizedBox(height: generalSpacing / 2), // Smaller spacing here

                Text(
                  'Login to your account.',
                  style: TextStyle(
                      color: AppColors.primaryGreen,
                      fontSize: subtitleFontSize,
                      fontWeight: FontWeight.w500
                  ),
                ),

                SizedBox(height: formSectionSpacing),

                CustomTextField(
                  hintText: 'Email Address or Phone Number',
                  controller: _emailController,
                ),

                SizedBox(height: betweenFieldsSpacing),

                CustomTextField(
                  hintText: 'Password',
                  isPassword: true,
                  controller: _passwordController,
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () { /* TODO: Implement forgot password */ },
                    child: Text(
                        'Forgot password?',
                        style: TextStyle(
                            color: AppColors.primaryGreen,
                            fontWeight: FontWeight.bold,
                            fontSize: smallTextFontSize,
                        )
                    ),
                  ),
                ),

                SizedBox(height: generalSpacing),

                CustomButton(
                  text: 'Login',
                  onPressed: () {
                    // TODO: Implement login logic
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => const HomeScreen()),
                    );
                  },
                ),

                SizedBox(height: formSectionSpacing),

                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const RegisterScreen()),
                    );
                  },
                  child: Text.rich(
                    TextSpan(
                      text: 'Not registered? ',
                      style: TextStyle(
                          color: AppColors.textColor,
                          fontSize: smallTextFontSize
                      ),
                      children: [
                        TextSpan(
                          text: 'Register now',
                          style: TextStyle(
                            color: AppColors.primaryGreen,
                            fontWeight: FontWeight.bold,
                            fontSize: smallTextFontSize,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: generalSpacing), // Added some padding at the bottom
              ],
            ),
          ),
        ),
      ),
    );
  }
}
