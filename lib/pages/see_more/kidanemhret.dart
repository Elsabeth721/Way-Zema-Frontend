import 'package:flutter/material.dart';
import 'package:way_zema/pages/see_more/yekatit16.dart';
import 'package:way_zema/pages/see_more/yekatit_list.dart';
import 'package:way_zema/pages/theme_color.dart';

final List<Artist> artistList = [
  Artist(name: 'የካቲት 16', destinationPage: YekatitList(title: 'የካቲት 16')),
  Artist(name: 'የነሐሴ 16', destinationPage: Yekatit16(title: 'የነሐሴ 16')),
  Artist(name: 'መስከረም 21', destinationPage: Yekatit16(title: 'መስከረም 21')),
  Artist(name: 'ህዳር 21', destinationPage: Yekatit16(title: 'ህዳር 21')),
  Artist(name: 'ታህሳስ 3', destinationPage: Yekatit16(title: 'ታህሳስ 3')),
  Artist(name: 'ጥር 21', destinationPage: Yekatit16(title: 'ጥር 21')),
  Artist(name: 'ግንቦት 1', destinationPage: Yekatit16(title: 'ግንቦት 1')),
  Artist(name: 'የእመቤታችን የዘወትር መዝሙራት', destinationPage: Yekatit16(title: 'የእመቤታችን የዘወትር መዝሙራት')),
];

class Artist {
  final String name;
  final Widget destinationPage;

  Artist({required this.name, required this.destinationPage});
}

class Kidanemhret extends StatelessWidget {
  final String title;

  Kidanemhret({required this.title});

  @override
  Widget build(BuildContext context) {
    ThemeColors themeColors = ThemeColors.fromContext(context);

    return Scaffold(
      backgroundColor: themeColors.backgroundColor,
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(
            color: themeColors.textColor,
            fontWeight: FontWeight.bold,
            fontSize: 33,
          ),
        ),
        centerTitle: true,
        backgroundColor: themeColors.appBarColor,
        iconTheme: IconThemeData(color: themeColors.iconColor),
        toolbarHeight: 100,
      ),
      body: ListView.builder(
        itemCount: artistList.length,
        itemBuilder: (context, index) {
          final artist = artistList[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => artist.destinationPage,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(15),
                elevation: 10,
                backgroundColor: themeColors.cardColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: themeColors.purpleColor,
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Text(
                      artist.name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: themeColors.textColor,
                      ),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, color: themeColors.iconColor),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
