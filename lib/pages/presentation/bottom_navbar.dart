import 'package:flutter/material.dart';
import 'package:way_zema/pages/theme_color.dart';

class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget({super.key});

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final themeColors = ThemeColors.fromContext(context); 

    return BottomNavigationBar(
      backgroundColor: themeColors.backgroundColor,
      selectedItemColor: themeColors.iconColor,
      unselectedItemColor: themeColors.secondaryTextColor.withOpacity(0.6),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
        // Navigate based on the selected index
        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, '/home');
            break;
          case 1:
            Navigator.pushReplacementNamed(context, '/mylibrary');
            break;
          case 2:
            Navigator.pushReplacementNamed(context, '/liked');
            break;
          case 3:
            Navigator.pushReplacementNamed(context, '/downloaded');
            break;
        }
      },
      currentIndex: _selectedIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: themeColors.iconColor),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.library_music, color: themeColors.iconColor),
          label: 'Library',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite, color: themeColors.iconColor),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.download, color: themeColors.iconColor),
          label: 'Downloads',
        ),
      ],
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w300,
        color: themeColors.iconColor,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w300,
        color: themeColors.secondaryTextColor.withOpacity(0.6),
      ),
    );
  }
}
