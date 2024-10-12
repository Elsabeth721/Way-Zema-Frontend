import 'package:flutter/material.dart';
import 'package:way_zema/pages/theme_color.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeColors themeColors = ThemeColors.fromContext(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColors.appBarColor,
        title: Text(
          'ስለ እኛ',
          style: TextStyle(color: themeColors.textColor),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: themeColors.purpleColor),
      ),
      body: Stack(
        children: [
          Container(
            decoration:  BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/brana4.jpg'), 
                fit: BoxFit.cover, 
                colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.7),
                      BlendMode.dstATop,
                    ),
              ),
            ),
          ),
    
          Padding(
            padding: const EdgeInsets.all(64.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '''ፍሬ ሃይማኖት በ 1978 ዓ.ም የተመሰረተ ሲሆን..... ''',
                    style: TextStyle(
                      color: themeColors.textColor,
                      fontSize: 16,
                      height: 1.5,
                    ),
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
