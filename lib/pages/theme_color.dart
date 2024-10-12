 import 'package:flutter/material.dart';

class ThemeColors {
  final bool isDarkTheme;
  final Color backgroundColor;
  final Color appBarColor;
  final Color textColor;
  final Color secondaryTextColor;
  final Color cardColor;
  final Color purpleColor;
  final Color iconColor;

  ThemeColors({
    required this.isDarkTheme,
    required this.backgroundColor,
    required this.appBarColor,
    required this.textColor,
    required this.secondaryTextColor,
    required this.cardColor,
    required this.purpleColor,
    required this.iconColor,
  });

  static ThemeColors fromContext(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    
    Color backgroundColor = isDarkTheme ? const Color(0xFF17181D) : const Color(0xFFFFCE8B);
    //  Color(0xFFF1EE8E)
    Color appBarColor = backgroundColor; 
    Color textColor = isDarkTheme ? Colors.white : Colors.black;
    Color secondaryTextColor = isDarkTheme ? Colors.white70 : Colors.black87;
    Color cardColor = isDarkTheme ? const Color(0XFF2A2929) : const Color(0xFFF7D197);
    Color purpleColor = isDarkTheme ? const Color(0xFFE09145) : const Color(0xFF5E3023);
    Color iconColor = isDarkTheme ? purpleColor : const Color(0xFF5E3023);

    return ThemeColors(
      isDarkTheme: isDarkTheme,
      backgroundColor: backgroundColor,
      appBarColor: appBarColor,
      textColor: textColor,
      secondaryTextColor: secondaryTextColor,
      cardColor: cardColor,
      purpleColor: purpleColor,
      iconColor: iconColor,
    );
  }
} 