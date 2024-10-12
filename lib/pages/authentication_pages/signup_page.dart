import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:way_zema/pages/theme_color.dart';
import 'package:way_zema/pages/widegets/custom_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isValidEmail(String email) {
    final RegExp emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(email);
  }

  Future<void> _signUp() async {
    if (_fullNameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill out all fields')),
      );
      return;
    }

    if (!_isValidEmail(_emailController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid email address')),
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
        email: _emailController.text,
        password: _passwordController.text,
      );

      if (signUpResponse.user == null) {
        final errorMessage = signUpResponse.error?.message ?? 'Unknown error occurred';
        print('Sign-up error: $errorMessage');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Sign-up failed: $errorMessage')),
        );
      } else {
        Navigator.pushNamed(
          context,
          '/email_verification',
          arguments: _emailController.text,
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeColors = ThemeColors.fromContext(context);

    return Scaffold(
      backgroundColor: themeColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 32,
                    color: themeColors.textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Join your own community',
                  style: TextStyle(
                    fontSize: 18,
                    color: themeColors.secondaryTextColor,
                  ),
                ),
                const SizedBox(height: 30),
                CustomInputField(
                  controller: _fullNameController,
                  placeholder: 'Full Name',
                  icon: Icons.person,
                  iconColor: themeColors.iconColor,
                ),
                CustomInputField(
                  controller: _emailController,
                  placeholder: 'Email',
                  icon: Icons.email,
                  iconColor: themeColors.iconColor,
                ),
                CustomInputField(
                  controller: _passwordController,
                  placeholder: 'Password',
                  icon: Icons.lock,
                  isPassword: true,
                  iconColor: themeColors.iconColor,
                ),
                CustomInputField(
                  controller: _confirmPasswordController,
                  placeholder: 'Confirm Password',
                  icon: Icons.lock,
                  isPassword: true,
                  iconColor: themeColors.iconColor,
                ),
                const SizedBox(height: 20),
                CustomButton(
                  text: 'Sign Up',
                  onPressed: _signUp,
                  backgroundColor: themeColors.purpleColor,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: TextStyle(color: themeColors.textColor),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/signin');
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(color: themeColors.purpleColor),
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

extension on AuthResponse {
  get error => null;
}
