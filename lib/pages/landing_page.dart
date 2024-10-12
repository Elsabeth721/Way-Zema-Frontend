import 'package:flutter/material.dart';
import 'package:way_zema/pages/theme_color.dart';
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
    final themeColors = ThemeColors.fromContext(context);

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/image/brana4.jpg', 
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: themeColors.backgroundColor.withOpacity(0.4), 
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ScaleTransition(
                  scale: _scaleAnimation,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/image/logo (2).png',
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
                      Text(
                        'ዋይ-ዜማ',
                        style: TextStyle(
                          fontSize: 50,
                          color: themeColors.textColor,
                        ),
                      ),
                      const SizedBox(height: 20),
                      CustomButton(
                        text: "ግባ",
                        onPressed: () {
                          Navigator.pushNamed(context, '/home');
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                children: [
                  Text(
                    'frehaymanot senbet tmhrt bet',
                    style: TextStyle(color: Colors.black)
                    // themeColors.secondaryTextColor),
                  ),
                  Text(
                    '2024 || All rights reserved',
                    style: TextStyle(color: Colors.black)

                    //  themeColors.secondaryTextColor),
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
