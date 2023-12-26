import 'package:flutter/material.dart';
import 'package:to_do_list/create_page.dart';
import 'package:to_do_list/home_page.dart';
import 'package:to_do_list/detail_page.dart';

class ListPageWidget extends StatelessWidget {
  final List<Map<String, dynamic>> user = [
    {
      "name": "Susan Lee",
      "design": "lorem ispsum dfl kdlk dfv",
      "date": "12/3/2023"
    },
    {
      "name": "Susan Lee",
      "design": "lorem ispsum dfl kdlk dfv",
      "date": "12/3/2023"
    },
    {
      "name": "Susan Lee",
      "design": "lorem ispsum dfl kdlk dfv",
      "date": "12/3/2023"
    },
    {
      "name": "Susan Lee",
      "design": "lorem ispsum dfl kdlk dfv",
    },
  ];

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
                    children: [
                      Icon(Icons.offline_bolt),
                      Text('see more'),
                    ],
                  ),
                ),
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
          Expanded(
            child: ListView.builder(
              itemCount: user.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPageWidget(),
                      ),
                    );
                  },
                  child: Container(
                    height: 110.0,
                    child: Card(
                      child: Row(
                        children: [
                          Text(user[index]['name'],
                              style: const TextStyle(
                                fontSize: 19.0,
                                fontWeight: FontWeight.w400,
                              )),
                          const SizedBox(width: 10.0),
                          Text(user[index]['design'],
                              style: const TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              )),
                          SizedBox(width: 10.0),
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              user[index]['date'] ?? '',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreatePageWidget(),
                  ),
                );
              },
              child: Text('Create Task'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                minimumSize: MaterialStateProperty.all(Size(90, 30)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
