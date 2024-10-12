import 'package:flutter/material.dart';
import 'package:way_zema/pages/presentation/bottom_navbar.dart';
import 'package:way_zema/pages/presentation/music_player.dart';
import 'package:way_zema/pages/theme_color.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class MyLibrary extends StatefulWidget {
  const MyLibrary({super.key});

  @override
  State<MyLibrary> createState() {
    return _MyLibraryState();
  }
}

class _MyLibraryState extends State<MyLibrary> {
  @override
  Widget build(context) {
    final themeColors = ThemeColors.fromContext(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: themeColors.backgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: themeColors.appBarColor,
          toolbarHeight: 100,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'የኔ መዝሙሮች',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: themeColors.textColor,
                fontSize: 33,
              ),
            ),
          ),
          bottom: TabBar(
            unselectedLabelColor: themeColors.secondaryTextColor,
            labelColor: themeColors.textColor,
            indicatorColor: themeColors.textColor,
            tabs: const [
              Tab(text: 'የቅርብ ጊዜ'),
              Tab(text: 'አጫዋች ዝርዝር'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [Recent(), Recent()],
        ),
        bottomNavigationBar: BottomNavBarWidget(
        
        ),
      ),
    );
  }
}

class Recent extends StatelessWidget {
  const Recent({super.key});

  @override
  Widget build(context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: List.generate(
            6,
            (index) => const Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: RecentMezmur(),
            ),
          ),
        ),
      ),
    );
  }
}

class RecentMezmur extends StatefulWidget {
  const RecentMezmur({super.key});

  @override
  State<RecentMezmur> createState() {
    return _RecentMezmurState();
  }
}

class _RecentMezmurState extends State<RecentMezmur> {
  final ShadPopoverController? popoverController = ShadPopoverController();

  @override
  void dispose() {
    popoverController?.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
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
        backgroundColor: themeColors.cardColor,
      ),
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
                      color: themeColors.secondaryTextColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          TextButton.icon(
            onPressed: () {},
            style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
            icon: Icon(
              Icons.more_horiz,
              size: 50,
              color: themeColors.iconColor,
            ),
            label: const Text(''),
          ),
        ],
      ),
    );
  }
}
