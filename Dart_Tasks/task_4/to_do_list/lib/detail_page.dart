import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/create_page.dart';
import 'package:to_do_list/home_page.dart';

class DetailPageWidget extends StatefulWidget {
  @override
  DetailPage createState() => DetailPage();
}

class DetailPage extends State<DetailPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Detail'),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
          child: Icon(
            Icons.chevron_left,
            color: Colors.red,
            size: 55.0,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                    child: Row(
                  children: [Icon(Icons.offline_bolt), Text('see more')],
                ))
              ],
              child: Icon(
                Icons.more_vert,
                size: 50.0,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Image(
            image: AssetImage('images/download (2).png'),
            height: 270.0,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(36.0, 0.0, 305.0, 5.0),
            child: Text('Title', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
            child: Container(
              width: 300.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: Color.fromARGB(220, 239, 233, 233),
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Text('UI/UX App Design'),
            ),
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: EdgeInsets.fromLTRB(36.0, 0.0, 275.0, 5.0),
            child: Text('Description',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
            child: Container(
              width: 300.0,
              height: 150.0,
              decoration: BoxDecoration(
                color: Color.fromARGB(220, 239, 233, 233),
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Text(
                  'First I have to animate the logo and prototyping my design. It\'s very important.'),
            ),
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: EdgeInsets.fromLTRB(36.0, 0.0, 285.0, 5.0),
            child:
                Text('Due date', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
            child: Container(
              width: 300.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: Color.fromARGB(220, 239, 233, 233),
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Text('April 29,2023'),
            ),
          ),
        ],
      ),
    );
  }
}
