import 'package:flutter/material.dart';
import 'package:way_zema/pages/theme_color.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeColors themeColors = ThemeColors.fromContext(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColors.appBarColor,
        title: Text(
          'Contact us',
          style: TextStyle(color: themeColors.textColor),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: themeColors.iconColor),
      ),
      body: Stack(
        children: [
          Container(
            decoration:  BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/image/brana4.jpg'), 
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
                    'የእኛ አድራሻ',
                    style: TextStyle(
                      color: themeColors.purpleColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'ስልክ: +251 930 902 480',
                    style: TextStyle(
                      color: themeColors.textColor,
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                  Text(
                    'ኢሜይል: example@email.com',
                    style: TextStyle(
                      color: themeColors.textColor,
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                  Text(
                    'ቴሌግራም: @example_telegram',
                    style: TextStyle(
                      color: themeColors.textColor,
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                  Text(
                    'ዩቱብ: https://www.youtube.com/example',
                    style: TextStyle(
                      color: themeColors.textColor,
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                  Text(
                    'ፌስቡክ: https://www.facebook.com/example',
                    style: TextStyle(
                      color: themeColors.textColor,
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                  Text(
                    'የድጋፍ ባንክ መዳረሻ: 1234567890',
                    style: TextStyle(
                      color: themeColors.textColor,
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'በዚህ አድራሻ ወይም ከዚህ በላይ ሙሉ መረጃ ይገኙ !',
                    style: TextStyle(
                      color: themeColors.secondaryTextColor,
                      fontSize: 14,
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
