import 'package:flutter/material.dart';
import 'package:way_zema/pages/widegets/custom_widget.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _scaleAnimation =
        Tween<double>(begin: 1.5, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _fadeAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color blackBack = const Color(0xFF0E123E);
    return Scaffold(
      backgroundColor: blackBack,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ScaleTransition(
                  scale: _scaleAnimation,
                  child: ClipOval(
                    child: Image.asset(
                      'image/logo (2).png',
                      width: 210,
                      height: 210,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20), 
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Column(
                    children: [
                      const Text(
                        'Way-Zema',
                        style: TextStyle(fontSize: 50, color: Colors.white),
                      ),
                      const SizedBox(height: 20), 
                      CustomButton(
                        text: "Login",
                        onPressed: () {
                          Navigator.pushNamed(context, '/signin'); 
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                children: [
                  Text(
                    'frehaymanot senbet tmhrt bet',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    '2024 ||All right reserved',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
