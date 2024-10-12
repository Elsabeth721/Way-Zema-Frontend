import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:way_zema/pages/theme_color.dart';
import 'package:way_zema/pages/widegets/custom_widget.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _signIn() async {
    try {
      final response = await Supabase.instance.client.auth.signInWithPassword(
        email: _emailController.text, // Use email instead of phone
        password: _passwordController.text,
      );

      if (response.user != null) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid email or password')),
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Access Community',
                  style: TextStyle(
                    fontSize: 32,
                    color: themeColors.textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Access Your Own Community',
                  style: TextStyle(
                    fontSize: 18,
                    color: themeColors.secondaryTextColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                CustomInputField(
                  controller: _emailController,
                  placeholder: 'Email',
                  icon: Icons.email,
                  iconColor: themeColors.iconColor,
                ),
                const SizedBox(height: 20),
                CustomInputField(
                  controller: _passwordController,
                  placeholder: 'Password',
                  icon: Icons.lock,
                  isPassword: true,
                  iconColor: themeColors.iconColor,
                ),
                const SizedBox(height: 20),
                CustomButton(
                  text: 'Sign In',
                  onPressed: _signIn,
                  backgroundColor: themeColors.purpleColor,
                  textColor: themeColors.textColor,
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/forgot-password');
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(color: themeColors.purpleColor),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account? ',
                      style: TextStyle(color: themeColors.textColor),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: Text(
                        'Sign Up',
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
