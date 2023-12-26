import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class File {
  final String name;
  final String description;
  final String image;
  File(this.name, this.description, this.image);
}

class MyApp extends StatelessWidget {
//const MyApp({super.key});
  final List<File> myFile = [
    File('Elsabeth', 'hi i am els', 'images/home_page.jpg'),
    File('Elsabeth', 'hi i am els', 'images/home_page.jpg'),
    File('Elsabeth', 'hi i am els', 'images/home_page.jpg'),
    File('Elsabeth', 'hi i am els', 'images/home_page.jpg'),
    File('Elsabeth', 'hi i am els', 'images/home_page.jpg'),
    File('Elsabeth', 'hi i am els', 'images/home_page.jpg'),
    File('Elsabeth', 'hi i am els', 'images/home_page.jpg'),
    File('Elsabeth', 'hi i am els', 'images/home_page.jpg'),
    File('Elsabeth', 'hi i am els', 'images/home_page.jpg'),
    File('Elsabeth', 'hi i am els', 'images/home_page.jpg'),
    File('Elsabeth', 'hi i am els', 'images/home_page.jpg'),
    File('Elsabeth', 'hi i am els', 'images/home_page.jpg'),
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          title: const Text('Basics'),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
        ),
        body: ListView.builder(
            itemCount: myFile.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: CircleAvatar(
                              radius: 20.0,
                              backgroundImage: AssetImage(myFile[index].image)),
                          title: Text(myFile[index].name),
                          subtitle: Text(myFile[index].description),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
