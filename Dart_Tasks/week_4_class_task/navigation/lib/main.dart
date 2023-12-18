import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:HomePage()
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text('Screen1'),
            centerTitle: true,
            backgroundColor: Colors.blue,
          ),
          body: Padding(padding: EdgeInsets.fromLTRB(10, 120, 10, 30),
          child:ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Screen2(),
                ),
              );
            },
            child: Text('Go to Screen 2'),
          ),),);
  }
}

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text('Screen2'),
            centerTitle: true,
            backgroundColor: Colors.blue,
          ),
          body: Padding(padding: EdgeInsets.fromLTRB(10, 120, 10, 30),
          child:ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Screen2(),
                ),
              );
            },
            style:ButtonStyle(backgroundColor: MaterialStatePropertyAll.)
            child: Text('Return to Screen 1'),
          ),),);
  }
}