import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:share_plus/share_plus.dart';
import 'package:way_zema/pages/about_us.dart';
import 'package:way_zema/pages/contact_us.dart';
import 'package:way_zema/pages/theme_color.dart';

class CustomDrawer extends StatelessWidget {
  final BuildContext context;
  final bool isDarkTheme;
  final Function toggleTheme;

  const CustomDrawer({
    required this.context,
    required this.isDarkTheme,
    required this.toggleTheme,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeColors = ThemeColors.fromContext(context);

    return Drawer(
      child: Container(
        color: themeColors.backgroundColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image/senbet.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                  Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'assets/image/logo (2).png',
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ዋይ-ዜማ',
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'እግዚአብሔርን አመስግኑ፤ መዝሙር መልካም ነውና። ለአምላካችን ምስጋና ያማረ ነው። መዝ146:1',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: Colors.white,
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.info, color: themeColors.iconColor),
              title: Text(
                'ስለ እኛ',
                style: TextStyle(color: themeColors.textColor),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AboutUsPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_page, color: themeColors.iconColor),
              title: Text(
                'ያግኙን',
                style: TextStyle(color: themeColors.textColor),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ContactPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.share, color: themeColors.iconColor),
              title: Text(
                'አጋራ',
                style: TextStyle(color: themeColors.textColor),
              ),
              onTap: () {
                Share.share('በፍሬ ሃይማኖት ሰንበት ት/ቤት የተዘጋጀውን የመዝሙር አፕሊኬሽን ይጎብኙ!!!');
              },
            ),
            SwitchListTile(
              secondary: Icon(Icons.lightbulb_outline, color: themeColors.iconColor),
              title: Text(
                isDarkTheme ? 'ነጭ ቲም' : 'ጥቁር ቲም',
                style: TextStyle(color: themeColors.textColor),
              ),
              value: isDarkTheme,
              activeColor: themeColors.purpleColor, 
              inactiveTrackColor: themeColors.textColor.withOpacity(0.2), 
              onChanged: (bool value) {
                toggleTheme();
              },
            ),
            ListTile(
              leading: Icon(Icons.login, color: themeColors.iconColor),
              title: Text(
                'Create Account',
                style: TextStyle(color: themeColors.textColor),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/signup');
              },
            ),
          ],
        ),
      ),
    );
  }
}
