import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:way_zema/pages/widegets/custom_widget.dart'; 

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

 Future<void> _sendResetLink() async {
    try {
      
      await Supabase.instance.client.auth.resetPasswordForEmail(_emailController.text);

     
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password reset link sent to your email')),
      );
      Navigator.pop(context);
    } catch (e) {
     
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    Color blackBack = const Color(0xFF0E123E);
    

    return Scaffold(
      backgroundColor: blackBack,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Forgot Password',
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Enter your email to receive a password reset link.',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white54,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                CustomInputField(
                  controller: _emailController,
                  placeholder: 'Email Address',
                  icon: Icons.email,
                ),
                const SizedBox(height: 20),
                CustomButton(
                  text: 'Send Reset Link',
                  onPressed: _sendResetLink,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
