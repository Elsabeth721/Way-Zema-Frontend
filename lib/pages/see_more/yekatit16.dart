import 'package:flutter/material.dart';
import 'package:way_zema/pages/see_more/yekatit_list.dart';
import 'package:way_zema/pages/theme_color.dart';

final List<Artist> artistList = [
  Artist(
    name: 'የካቲት 16',
    destinationPage: YekatitList(title: 'የካቲት 16'),
  ),
  Artist(
    name: 'የነሐሴ 16',
    destinationPage: YekatitList(title: 'የነሐሴ 16'),
  ),
  Artist(
    name: 'መስከረም 21',
    destinationPage: YekatitList(title: 'መስከረም 21'),
  ),
  Artist(
    name: 'ህዳር 21',
    destinationPage: YekatitList(title: 'ህዳር 21'),
  ),
  Artist(
    name: 'ታህሳስ 3',
    destinationPage: YekatitList(title: 'ታህሳስ 3'),
  ),
  Artist(
    name: 'ጥር 21',
    destinationPage: YekatitList(title: 'ጥር 21'),
  ),
  Artist(
    name: 'ግንቦት 1',
    destinationPage: YekatitList(title: 'ግንቦት 1'),
  ),
  Artist(
    name: 'የእመቤታችን የዘወትር መዝሙራት',
    destinationPage: YekatitList(title: 'የእመቤታችን የዘወትር መዝሙራት'),
  ),
];

class Artist {
  final String name;
  final Widget destinationPage;

  Artist({required this.name, required this.destinationPage});
}

class Yekatit16 extends StatelessWidget {
  final String title;

  Yekatit16({required this.title});

  @override
  Widget build(BuildContext context) {
    ThemeColors themeColors = ThemeColors.fromContext(context);

    return Scaffold(
      backgroundColor: themeColors.backgroundColor,
      appBar: AppBar(
        title: Text(title, style: TextStyle(color: themeColors.textColor)),
        centerTitle: true,
        backgroundColor: themeColors.appBarColor,
        iconTheme: IconThemeData(color: themeColors.iconColor),
      ),
      body: ListView.builder(
        itemCount: artistList.length,
        itemBuilder: (context, index) {
          final artist = artistList[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => artist.destinationPage,
                  ),
                );
              },
              child: Card(
                color: themeColors.cardColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 4,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: themeColors.purpleColor,
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(
                    artist.name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: themeColors.textColor,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
