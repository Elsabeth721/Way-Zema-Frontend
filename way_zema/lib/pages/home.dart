import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Color backgroundColor = const Color(0xFF0E123E); 
    Color purpleColor = const Color(0xFF7258AE); 
    
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: IconButton(
          icon: Icon(Icons.menu, color: purpleColor),
          onPressed: () {
           
          },
        ),
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(color: purpleColor, width: 2), 
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search, color: purpleColor),
              hintText: 'Search...',
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person, color: purpleColor),
            onPressed: () {
             
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Container(
            width: 340,
            height: 196,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage('image/logo (2).png'), 
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
