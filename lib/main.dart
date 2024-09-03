import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:way_zema/pages/landing_page.dart';
import 'package:way_zema/pages/authentication_pages/forget_password.dart';
import 'package:way_zema/pages/home.dart';
import 'package:way_zema/pages/authentication_pages/otp_verification.dart';
import 'package:way_zema/pages/authentication_pages/signin_page.dart';
import 'package:way_zema/pages/authentication_pages/signup_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Supabase.initialize(
    url: 'https://mvahuftbwphwncbxxyko.supabase.co', 
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im12YWh1ZnRid3Bod25jYnh4eWtvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjQ3NDk4MTcsImV4cCI6MjA0MDMyNTgxN30.Qp_p0OpHLvS1100anRqQIg6vJq7YZkZTNJY9UgTfHHI',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final client = Supabase.instance.client;
    
    return MaterialApp(
      title: 'Way-Zema',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: client.auth.currentSession != null ? '/landing' : '/landing',
      routes: {
        '/landing': (context) => const LandingPage(),
        '/signin': (context) => const SignInPage(),
        '/signup': (context) => const SignUpPage(),
        '/forgot-password': (context) => const ForgotPasswordPage(),
        '/otp-verification': (context) => const OtpVerificationPage(phoneNumber:''),
        '/home': (context) =>  HomePage(),

      },
      home: client.auth.currentSession != null ? const LandingPage() : const LandingPage(),
    );
  }
}
