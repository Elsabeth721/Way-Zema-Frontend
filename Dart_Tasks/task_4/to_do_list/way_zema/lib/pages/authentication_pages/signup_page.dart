import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:way_zema/pages/widegets/custom_widget.dart'; 
import 'otp_verification.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  Future<void> _signUp() async {
    if (_fullNameController.text.isEmpty ||
        _phoneController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill out all fields')),
      );
      return;
    }

    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }

    try {
      final signUpResponse = await Supabase.instance.client.auth.signUp(
        phone: _phoneController.text,
        password: _passwordController.text,
      );

      if (signUpResponse.user == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Sign-up failed')),
        );
        return;
      }

      // OTP page 
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OtpVerificationPage(phoneNumber: _phoneController.text),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Color blackBack = const Color(0xFF0E123E);
    Color purpleColor = const Color(0xFF7258AE);
    return Scaffold(
      backgroundColor: blackBack,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Join your own community',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white54,
                  ),
                ),
                const SizedBox(height: 30),
                CustomInputField(
                  controller: _fullNameController,
                  placeholder: 'Full Name',
                  icon: Icons.person,
                ),
                CustomInputField(
                  controller: _phoneController,
                  placeholder: 'Phone Number',
                  icon: Icons.phone,
                ),
                CustomInputField(
                  controller: _passwordController,
                  placeholder: 'Password',
                  icon: Icons.lock,
                  isPassword: true,
                ),
                CustomInputField(
                  controller: _confirmPasswordController,
                  placeholder: 'Confirm Password',
                  icon: Icons.lock,
                  isPassword: true,
                ),
                const SizedBox(height: 20),
                CustomButton(
                  text: 'Sign Up',
                  onPressed: _signUp,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account? ',
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/signin');
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(color: purpleColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
