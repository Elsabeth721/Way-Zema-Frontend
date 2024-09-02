import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:way_zema/pages/widegets/custom_widget.dart'; 

class OtpVerificationPage extends StatefulWidget {
  final String phoneNumber;

  const OtpVerificationPage({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  _OtpVerificationPageState createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  final _otpController = TextEditingController();

  Future<void> _verifyOtp() async {
    try {
      final response = await Supabase.instance.client.auth.verifyOTP(
        phone: widget.phoneNumber,
        token: _otpController.text,
        type: OtpType.sms,
      );

      if (response.user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Verification successful!')),
        );
        Navigator.pushReplacementNamed(context, '/landing');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Verification failed')),
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
    Color blackBack = const Color(0xFF0E123E);
    

    return Scaffold(
      backgroundColor: blackBack,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Enter OTP sent to ${widget.phoneNumber}',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              const SizedBox(height: 20),
              CustomInputField(
                controller: _otpController,
                placeholder: 'OTP',
                icon: Icons.code,
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: 'Verify OTP',
                onPressed: _verifyOtp,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
