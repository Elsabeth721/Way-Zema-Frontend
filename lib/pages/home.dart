
import 'dart:io'; 
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:way_zema/pages/drawer.dart';
import 'package:way_zema/pages/presentation/bottom_navbar.dart';
import 'package:way_zema/pages/profile.dart';
import 'package:way_zema/pages/see_more/see_more_categories.dart';
import 'package:way_zema/pages/theme_color.dart';
import 'package:way_zema/pages/widegets/custom_widget.dart';

class HomePage extends StatefulWidget {
  final Function toggleTheme;
  final bool isDarkTheme;

  const HomePage({Key? key, required this.toggleTheme, required this.isDarkTheme})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState(); 
}

class _HomePageState extends State<HomePage> {
  final List<String> artistImage = [
    'assets/image/kesisAshenafi.jpg',
    'assets/image/tewodros.jpg',
    'assets/image/yilma.jpg',
    'assets/image/mirtnesh.jpg',
    'assets/image/gebreyohannes.jpg',
    'assets/image/kesisMndaye.jpg',
  ];

  final List<Widget> containerList = [
    Container(color: Colors.red),
    Container(color: Colors.blue),
    Container(color: Colors.green),
    Container(color: Colors.yellow),
    Container(color: Colors.purple),
    Container(color: Colors.orange),
  ];

  final List<String> kidusImage = [
    'assets/image/kidanemhret.jpg',
    'assets/image/k-giorgis.jpg',
    'assets/image/kidstslase.jpg',
    'assets/image/k-gebreal.jpg',
    'assets/image/k-abunearegawi.jpg',
    'assets/image/kidanemhret.jpg',
  ];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  File? _profileImage; 

  @override
  void initState() {
    super.initState();
    _loadProfileImage(); 
  }

  Future<void> _loadProfileImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? imagePath = prefs.getString('profileImage'); 
    if (imagePath != null) {
      setState(() {
        _profileImage = File(imagePath);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeColors = ThemeColors.fromContext(context);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: themeColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: themeColors.appBarColor,
        leading: IconButton(
          icon: Icon(Icons.menu, color: themeColors.iconColor, size: 30),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: _buildSearchField(themeColors.iconColor),
        actions: [
          IconButton(
            icon: _profileImage != null
                ? CircleAvatar(
                    backgroundImage: FileImage(_profileImage!), 
                    radius: 15,
                  )
                : Icon(Icons.person, color: themeColors.iconColor, size: 30),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              ).then((_) {
                _loadProfileImage(); 
              });
            },
          ),
        ],
      ),
      drawer: CustomDrawer(
        context: context,
        isDarkTheme: widget.isDarkTheme,
        toggleTheme: widget.toggleTheme,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            TimedImageWidget(),
            const SizedBox(height: 20),
            _buildArtistSection(context),
            const SizedBox(height: 20),
            _buildKidusSection(context),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBarWidget(),
    );
  }

  Widget _buildSearchField(Color iconColor) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: iconColor, width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: iconColor),
          hintText: 'ፈልግ...',
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }

  Widget _buildArtistSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, 
          children: [
            Text('ዘማሪያን', style: Theme.of(context).textTheme.titleLarge),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SeeMoreKidus()),
                );
              },
              child: Text('ሁሉንም ተመልከት', style: Theme.of(context).textTheme.titleLarge),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          height: 150.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: artistImage.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  width: 100.0,
                  height: 100.0,
                  child: ClipOval(
                    child: Image.asset(
                      artistImage[index],
                      width: 100.0,
                      height: 100.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildKidusSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('የተለያዩ', style: Theme.of(context).textTheme.titleLarge),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SeeMoreKidus()),
                );
              },
              child: Text('ሁሉንም ተመልከት', style: Theme.of(context).textTheme.titleLarge),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          height: 150.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: kidusImage.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  width: 100.0,
                  height: 100.0,
                  child: ClipOval(
                    child: Image.asset(
                      kidusImage[index],
                      width: 100.0,
                      height: 100.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

