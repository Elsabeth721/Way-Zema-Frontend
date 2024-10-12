import 'package:flutter/material.dart';
import 'package:way_zema/pages/presentation/bottom_navbar.dart';
import 'package:way_zema/pages/presentation/music_player.dart';
import 'package:way_zema/pages/theme_color.dart';

class LikedMezmurs extends StatelessWidget {
  const LikedMezmurs({super.key});

  @override
  Widget build(BuildContext context) {
    final themeColors = ThemeColors.fromContext(context);

    return Scaffold(
      backgroundColor: themeColors.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: themeColors.appBarColor,
        toolbarHeight: 100,
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'የተወደዱ መዝሙሮች',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 33,
            ),
          ),
        ),
      ),
      body: const SingleChildScrollView(child: Liked()),
      bottomNavigationBar: BottomNavBarWidget(),
    );
  }
}

class Liked extends StatelessWidget {
  const Liked({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: const Column(
        children: [
          LikedMezmur(),
          SizedBox(height: 15),
          LikedMezmur(),
          SizedBox(height: 15),
          LikedMezmur(),
          SizedBox(height: 15),
          LikedMezmur(),
          SizedBox(height: 15),
          LikedMezmur(),
        ],
      ),
    );
  }
}

class LikedMezmur extends StatelessWidget {
  const LikedMezmur({super.key});

  @override
  Widget build(BuildContext context) {
    final themeColors = ThemeColors.fromContext(context);

    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const MusicPlayer()),
        );
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: themeColors.cardColor, ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/image/music_image.png',
                width: 100,
                height: 100,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ያዕቆብ ከቤርሳቤህ',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: themeColors.textColor,
                    ),
                  ),
                  Text(
                    'ይልማ ሀይሉ',
                    style: TextStyle(
                      fontSize: 12,
                      color: themeColors.textColor, 
                    ),
                  ),
                ],
              ),
            ],
          ),
          TextButton.icon(
            onPressed: () => {},
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(0),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            icon: Icon(
              Icons.favorite,
              size: 35,
              color: themeColors.iconColor, 
            ),
            label: Container(),
          ),
        ],
      ),
    );
  }
}
