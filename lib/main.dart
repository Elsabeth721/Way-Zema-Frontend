import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:way_zema/pages/authentication_pages/email_verfication.dart';
import 'package:way_zema/pages/landing_page.dart';
import 'package:way_zema/pages/authentication_pages/forget_password.dart';
import 'package:way_zema/pages/home.dart';
import 'package:way_zema/pages/authentication_pages/signin_page.dart';
import 'package:way_zema/pages/authentication_pages/signup_page.dart';
import 'package:way_zema/pages/presentation/download.dart';
import 'package:way_zema/pages/presentation/favourite.dart';
import 'package:way_zema/pages/presentation/my_library.dart';
import 'package:way_zema/pages/theme_color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://mvahuftbwphwncbxxyko.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im12YWh1ZnRid3Bod25jYnh4eWtvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjQ3NDk4MTcsImV4cCI6MjA0MDMyNTgxN30.Qp_p0OpHLvS1100anRqQIg6vJq7YZkZTNJY9UgTfHHI',
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkTheme = false;

  void _toggleTheme() {
    setState(() {
      _isDarkTheme = !_isDarkTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    final client = Supabase.instance.client;

    return MaterialApp(
      title: 'Way-Zema',
      theme: ThemeData(
        brightness: _isDarkTheme ? Brightness.dark : Brightness.light,
        primarySwatch: Colors.deepPurple, 
        useMaterial3: true, 
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: client.auth.currentSession != null ? '/landing' : '/landing',
      routes: {
        '/landing': (context) => const LandingPage(),
        '/signin': (context) => const SignInPage(),
        '/signup': (context) => const SignUpPage(),
        '/email_verification': (context) => EmailVerificationPage(
              email: ModalRoute.of(context)?.settings.arguments as String,
            ),
        '/home': (context) => HomePage(
              toggleTheme: _toggleTheme,
              isDarkTheme: _isDarkTheme,
            ),
        '/mylibrary': (context) => const MyLibrary(),
        '/downloaded': (context) => const DownloadedMezmurs(),
        '/liked': (context) => const LikedMezmurs(),
      },
    );
  }
}