import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginSignupPage extends StatefulWidget {
  @override
  _LoginSignupPageState createState() => _LoginSignupPageState();
}

class _LoginSignupPageState extends State<LoginSignupPage> {
  bool isLogin = true;
  bool showPassword = false;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isLogin ? Color(0xFFE3F4F1) : Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Icon(Icons.eco, size: 64, color: Colors.green), // Logo placeholder
                SizedBox(height: 16),
                Text(
                  isLogin ? "Login" : "Register",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.green),
                ),
                SizedBox(height: 8),
                Text(
                  isLogin ? "Login to your account." : "Create an account to get started",
                  style: TextStyle(color: Colors.black54),
                ),
                SizedBox(height: 30),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      if (!isLogin) _inputField("Name", controller: name),
                      _inputField("Email Address or Phone Number", controller: email),
                      _inputField(
                        "Password",
                        controller: password,
                        isPassword: true,
                      ),
                      if (!isLogin)
                        _inputField(
                          "Confirm Password",
                          controller: confirmPassword,
                          isPassword: true,
                        ),
                      if (!isLogin) _termsAndConditionsCheckbox(),
                      SizedBox(height: 20),
                      _submitButton(context),
                      SizedBox(height: 12),
                      if (isLogin)
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text("Forgot password?", style: TextStyle(color: Colors.green)),
                          ),
                        ),
                      _toggleButton(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _inputField(String hint,
      {TextEditingController? controller, bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword && !showPassword,
        decoration: InputDecoration(
          hintText: hint,
          suffixIcon: isPassword
              ? IconButton(
            icon: Icon(
              showPassword ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
            onPressed: () {
              setState(() => showPassword = !showPassword);
            },
          )
              : null,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget _termsAndConditionsCheckbox() {
    return Row(
      children: [
        Checkbox(value: true, onChanged: (_) {}),
        Flexible(
          child: Text.rich(
            TextSpan(
              text: "I've read and agree with the ",
              children: [
                TextSpan(
                  text: "Terms and Conditions",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
                ),
                TextSpan(text: " and the "),
                TextSpan(
                  text: "Privacy Policy.",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _submitButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => HomePage()),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        minimumSize: Size(double.infinity, 48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(isLogin ? "Login" : "Create Account"),
    );
  }

  Widget _toggleButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(isLogin ? "Not a member? " : "Already have an account? "),
        GestureDetector(
          onTap: () {
            setState(() => isLogin = !isLogin);
          },
          child: Text(
            isLogin ? "Register now" : "Login here",
            style: TextStyle(
              color: isLogin ? Colors.blue : Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
