import 'package:flutter/material.dart';
import 'package:way_zema/pages/theme_color.dart';

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({super.key});

  @override
  State<MusicPlayer> createState() {
    return _MusicPlayerState();
  }
}

class _MusicPlayerState extends State<MusicPlayer> {
  double sliderValue = 3;
  double fontSize = 16;

  @override
  Widget build(BuildContext context) {
    ThemeColors themeColors = ThemeColors.fromContext(context);

    return Scaffold(
      backgroundColor: themeColors.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: themeColors.appBarColor,
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                onPressed: () => {},
                style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
                icon: Icon(
                    size: 40,
                    color: themeColors.iconColor,
                    Icons.keyboard_arrow_down_sharp),
                label: const Text(''),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (fontSize > 10) fontSize -= 2;
                      });
                    },
                    icon: Icon(Icons.remove, color: themeColors.iconColor),
                  ),
                  Text(
                    "Font",
                    style: TextStyle(color: themeColors.textColor),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        fontSize += 2;
                      });
                    },
                    icon: Icon(Icons.add, color: themeColors.iconColor),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: const AssetImage('assets/image/brana4.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.7),
                      BlendMode.dstATop,
                    ),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Text(
                    '''ሶበሰ ኪዲንኪ ምክንያተ ዴኂን ኢሀል(2)
                    ፇሇገ እሳት ወዯይን እምአስጠመኩል
                    ፇሇገ እሳት /ወዯይን/(2) እምአስጠመኩል
                    ትርጉም፡-የዴህነት ምክንያት የሆነው ቃሌኪዲንሽ ባይኖር
                    ኖሮ የእሳት ባህር ሁለን ባሰጠመ ነበር
                    ሶበሰ ኪዲንኪ ምክንያተ ዴኂን ኢሀል(2)
                    ፇሇገ እሳት ወዯይን እምአስጠመኩል
                    ፇሇገ እሳት /ወዯይን/(2) እምአስጠመኩል
                    ትርጉም፡-የዴህነት ምክንያት የሆነው ቃሌኪዲንሽ ባይኖር
                    ኖሮ የእሳት ባህር ሁለን ባሰጠመ ነበር''',
                    style: TextStyle(
                        color: themeColors.textColor,
                        fontSize: fontSize,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ቀሲስ ምንዳዬ',
                        style: TextStyle(
                          color: themeColors.secondaryTextColor,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        'ፍቅርህ ማረከኝ',
                        style: TextStyle(
                          color: themeColors.textColor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SliderTheme(
                      data: SliderThemeData(
                        overlayShape: SliderComponentShape.noOverlay,
                      ),
                      child: Slider(
                        min: 0,
                        max: 4,
                        value: sliderValue,
                        activeColor: themeColors.purpleColor,
                        inactiveColor: themeColors.iconColor.withOpacity(0.5),
                        onChanged: (value) {
                          setState(() {
                            sliderValue = value;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '00:00',
                            style: TextStyle(
                              color: themeColors.secondaryTextColor,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            '04:00',
                            style: TextStyle(
                              color: themeColors.secondaryTextColor,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextButton.icon(
                        style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(0)),
                        onPressed: () {},
                        icon: Icon(
                            size: 35,
                            color: themeColors.iconColor,
                            Icons.repeat),
                        label: const Text(''),
                      ),
                    ),
                    Expanded(
                      child: TextButton.icon(
                        style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(0)),
                        onPressed: () {},
                        icon: Icon(
                            size: 35,
                            color: themeColors.iconColor,
                            Icons.skip_previous),
                        label: const Text(''),
                      ),
                    ),
                    Expanded(
                      child: TextButton.icon(
                        style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(0)),
                        onPressed: () {},
                        icon: Icon(
                            size: 35,
                            color: themeColors.iconColor,
                            Icons.play_arrow),
                        label: const Text(''),
                      ),
                    ),
                    Expanded(
                      child: TextButton.icon(
                        style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(0)),
                        onPressed: () {},
                        icon: Icon(
                            size: 35,
                            color: themeColors.iconColor,
                            Icons.skip_next),
                        label: const Text(''),
                      ),
                    ),
                    Expanded(
                      child: TextButton.icon(
                        style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(0)),
                        onPressed: () {},
                        icon: Icon(
                            size: 35,
                            color: themeColors.iconColor,
                            Icons.shuffle),
                        label: const Text(''),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                        style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(0)),
                        onPressed: () {},
                        icon: Icon(
                            size: 32,
                            color: themeColors.iconColor,
                            Icons.favorite_outline),
                        label: const Text('')),
                    Row(
                      children: [
                        TextButton.icon(
                            style: TextButton.styleFrom(
                                padding: const EdgeInsets.all(0)),
                            onPressed: () {},
                            icon: Icon(
                                size: 32,
                                color: themeColors.iconColor,
                                Icons.download),
                            label: const Text('')),
                        TextButton.icon(
                            style: TextButton.styleFrom(
                                padding: const EdgeInsets.all(0)),
                            onPressed: () {},
                            icon: Icon(
                                size: 32,
                                color: themeColors.iconColor,
                                Icons.settings),
                            label: const Text('')),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
