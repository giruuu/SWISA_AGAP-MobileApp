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
    return Scaffold(
      backgroundColor: AppColors.splashBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 80),

                // --- CHANGE IS HERE ---
                // The leaf icon has been replaced with your circular swisa_logo.png
                const CircleAvatar(
                  radius: 60, // A bit smaller than the splash screen's logo
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('assets/images/swisa_logo.png'),
                ),
                // --- END OF CHANGE ---

                const SizedBox(height: 20),

                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryGreen,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  'Login to your account.',
                  style: TextStyle(
                      color: AppColors.primaryGreen,
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                  ),
                ),

                const SizedBox(height: 40),

                CustomTextField(
                  hintText: 'Email Address or Phone Number',
                  controller: _emailController,
                ),

                const SizedBox(height: 20),

                CustomTextField(
                  hintText: 'Password',
                  isPassword: true,
                  controller: _passwordController,
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () { /* TODO: Implement forgot password */ },
                    child: const Text(
                        'Forgot password?',
                        style: TextStyle(
                            color: AppColors.primaryGreen,
                            fontWeight: FontWeight.bold
                        )
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                CustomButton(
                  text: 'Login',
                  onPressed: () {
                    // TODO: Implement login logic
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => const HomeScreen()),
                    );
                  },
                ),

                const SizedBox(height: 40),

                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const RegisterScreen()),
                    );
                  },
                  child: Text.rich(
                    TextSpan(
                      text: 'Not registered? ',
                      style: const TextStyle(
                          color: AppColors.textColor,
                          fontSize: 14
                      ),
                      children: [
                        TextSpan(
                          text: 'Register now',
                          style: const TextStyle(
                            color: AppColors.primaryGreen,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}