import 'package:flutter/material.dart';
import 'package:way_zema/pages/theme_color.dart';

class EmailVerificationPage extends StatelessWidget {
  final String email;

  const EmailVerificationPage({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeColors = ThemeColors.fromContext(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColors.appBarColor,
        title: Text(
          'Verify Your Email',
          style: TextStyle(color: themeColors.appBarColor),
        ),
        iconTheme: IconThemeData(color: themeColors.iconColor),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'A verification email has been sent to $email',
                style: TextStyle(
                  fontSize: 18,
                  color: themeColors.textColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: themeColors.textColor, 
                  backgroundColor: themeColors.purpleColor,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/signin');
                },
                child: Text(
                  'Back to Sign In',
                  style: TextStyle(
                    color: themeColors.textColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: themeColors.backgroundColor,
    );
  }
}
