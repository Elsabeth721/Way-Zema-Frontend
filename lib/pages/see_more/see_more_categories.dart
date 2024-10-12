import 'package:flutter/material.dart';
import 'package:way_zema/pages/see_more/kidanemhret.dart';
import 'package:way_zema/pages/theme_color.dart';

final List<Artist> kidusList = [
  Artist(
    image: 'assets/image/kidanemhret.jpg',
    name: 'Kidane Mihret',
    destinationPage: Kidanemhret(title: 'Kidane Mihret'),
  ),
  Artist(
    image: 'assets/image/k-giorgis.jpg',
    name: 'Kidus Giorgis',
    destinationPage: Kidanemhret(title: 'Kidus Giorgis'),
  ),
  Artist(
    image: 'assets/image/kidstslase.jpg',
    name: 'Kidus Tsilase',
    destinationPage: Kidanemhret(title: 'Kidus Tsilase'),
  ),
  Artist(
    image: 'assets/image/k-gebreal.jpg',
    name: 'Kidus Gebreal',
    destinationPage: Kidanemhret(title: 'Kidus Gebreal'),
  ),
  Artist(
    image: 'assets/image/k-abunearegawi.jpg',
    name: 'Abune Aregawi',
    destinationPage: Kidanemhret(title: 'Abune Aregawi'),
  ),
];

class Artist {
  final String image;
  final String name;
  final Widget destinationPage;

  Artist({required this.image, required this.name, required this.destinationPage});
}

class SeeMoreKidus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeColors = ThemeColors.fromContext(context);

    return Scaffold(
      backgroundColor: themeColors.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: themeColors.textColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'በክፍሎች',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 33,
          ),
        ),
        backgroundColor: themeColors.appBarColor,
        centerTitle: true,
        toolbarHeight: 100,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: kidusList.map((artist) {
              return Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => artist.destinationPage,
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      elevation: 10,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      backgroundColor: themeColors.cardColor, // Use cardColor for button background
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ClipOval(
                              child: Image.asset(
                                artist.image,
                                width: 120,
                                height: 120,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  artist.name,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: themeColors.textColor, // Use textColor
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Icon(
                          Icons.more_horiz,
                          size: 50,
                          color: themeColors.iconColor, // Use iconColor
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
