import 'package:flutter/material.dart';
import 'package:to_do_list/create_page.dart';
import 'package:to_do_list/home_page.dart';
import 'package:to_do_list/detail_page.dart';

class ListPageWidget extends StatefulWidget {
  @override
  ListPage createState() => ListPage();
}

class ListPage extends State<ListPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
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
          Image(image: AssetImage('images/list.png'), height: 230.0),
          Padding(
            padding: EdgeInsets.fromLTRB(1.0, 0.0, 250.0, 8.0),
            child: Text(
              'Tasks list',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailPageWidget()),
              );
            },
            child: Padding(
              padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
              child: Container(
                height: 70.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Text('U',
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                    SizedBox(
                      width: 17.0,
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      child: Text('UI/UX App Design',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    SizedBox(
                      width: 60.0,
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      child: Text('April.29,2023'),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      height: 55.0,
                      width: 4.0,
                      color: Colors.red,
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20.0, 220.0, 20.0, 10.0),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreatePageWidget()));
              },
              child: Text('Create Task'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                minimumSize: MaterialStateProperty.all(Size(90, 30)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
