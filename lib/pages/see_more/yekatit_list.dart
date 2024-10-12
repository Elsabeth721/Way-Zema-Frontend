import 'package:flutter/material.dart';
import 'package:way_zema/pages/presentation/music_player.dart';
import 'package:way_zema/pages/theme_color.dart';

final List<Artist> artistList = [
  Artist(
    name: 'ሶበሰ ኪዲንኪ ',
    destinationPage: MusicPlayer(),
  ),
  Artist(
    name: 'አማን በአማን',
    destinationPage: YekatitList(title: 'አማን በአማን'),
  ),
  Artist(
    name: 'ኪዲንኪ ኮነ',
    destinationPage: YekatitList(title: 'ኪዲንኪ ኮነ'),
  ),
  Artist(
    name: 'ፀሏየ ጽዴቅ',
    destinationPage: YekatitList(title: 'ፀሏየ ጽዴቅ'),
  ),
  Artist(
    name: 'ኪዲንኪ',
    destinationPage: YekatitList(title: 'ታህሳስ 3'),
  ),
  Artist(
    name: 'ሰሊም ሇኪ',
    destinationPage: YekatitList(title: 'ሰሊም ሇኪ'),
  ),
  Artist(
    name: 'እንበሇ ምግባር',
    destinationPage: YekatitList(title: 'እንበሇ ምግባር'),
  ),
  Artist(
    name: 'ቅንዐ',
    destinationPage: YekatitList(title: 'ቅንዐ'),
  ),
];

class Artist {
  final String name;
  final Widget destinationPage;

  Artist({required this.name, required this.destinationPage});
}

class YekatitList extends StatefulWidget {
  final String title;

  YekatitList({required this.title});

  @override
  _YekatitListState createState() => _YekatitListState();
}

class _YekatitListState extends State<YekatitList> {
  @override
  Widget build(BuildContext context) {
    ThemeColors themeColors = ThemeColors.fromContext(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: themeColors.backgroundColor,
        appBar: AppBar(
          title: Text(
            widget.title,
            style: TextStyle(
              color: themeColors.textColor,
              fontFamily: 'Abyssinica',
            ),
          ),
          centerTitle: true,
          backgroundColor: themeColors.appBarColor,
          iconTheme: IconThemeData(color: themeColors.iconColor),
          bottom: TabBar(
            unselectedLabelColor: themeColors.secondaryTextColor,
            labelColor: themeColors.textColor,
            indicatorColor: themeColors.textColor,
            tabs: const [
              Tab(text: 'የወረብ'), 
              Tab(text: 'የዝማሬ'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildArtistList(),
            buildArtistList(),
          ],
        ),
      ),
    );
  }

  Widget buildArtistList() {
    return ListView.builder(
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
              color: ThemeColors.fromContext(context).cardColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 4,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: ThemeColors.fromContext(context).purpleColor,
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                title: Text(
                  artist.name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: ThemeColors.fromContext(context).textColor,
                    fontFamily: 'Abyssinica',
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
