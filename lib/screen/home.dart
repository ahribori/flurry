import 'dart:convert';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flurry/model/todo.model.dart';
import 'package:flurry/provider/todo.provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:supercharged/supercharged.dart';

class Home extends StatelessWidget {
  fetchTodo(BuildContext context) async {
    HapticFeedback.lightImpact();
    var response =
        await http.get('https://jsonplaceholder.typicode.com/todos/1');
    Map todoMap = jsonDecode(response.body);
    var todo = Todo.fromJson(todoMap);

    context.read<TodoProvider>().addTodo(todo);
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: '#5a4fef'.toColor(),
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        animationDuration: Duration(milliseconds: 200),
        animationCurve: Curves.easeInOut,
        backgroundColor: '#5a4fef'.toColor(),
        items: <Widget>[
          Icon(Icons.check_box_outline_blank, size: 30),
          Icon(Icons.check_box, size: 30),
          Icon(Icons.settings, size: 30),
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.only(
              top: statusBarHeight + 8, right: 8, bottom: 8, left: 8),
          children: [
            Card(
              child: InkWell(
                splashColor: Colors.deepPurpleAccent.withAlpha(30),
                onTap: () {
                  print('Card tapped.');
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  child: Row(
                    children: [
                      Expanded(
                          child: const ListTile(
                        title: Text(
                          '마트에서 장보기',
                          style: TextStyle(fontSize: 20),
                        ),
                        subtitle: Text('2020년 7월 8일 오후 3시'),
                      )),
                      Container(
                        margin: EdgeInsets.only(right: 8),
                        child: IconButton(
                          iconSize: 28,
                          icon: Icon(Icons.check_box_outline_blank),
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Card(
              child: InkWell(
                splashColor: Colors.deepPurpleAccent.withAlpha(30),
                onTap: () {
                  print('Card tapped.');
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  child: Row(
                    children: [
                      Expanded(
                          child: const ListTile(
                        title: Text(
                          '블로그에 글쓰기',
                          style: TextStyle(fontSize: 20),
                        ),
                        subtitle: Text('2020년 7월 8일 오후 3시'),
                      )),
                      Container(
                        margin: EdgeInsets.only(right: 8),
                        child: IconButton(
                          iconSize: 28,
                          icon: Icon(Icons.check_box_outline_blank),
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Card(
              child: InkWell(
                splashColor: Colors.deepPurpleAccent.withAlpha(30),
                onTap: () {
                  print('Card tapped.');
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  child: Row(
                    children: [
                      Expanded(
                          child: const ListTile(
                        title: Text(
                          '잠자기',
                          style: TextStyle(fontSize: 20),
                        ),
                        subtitle: Text('2020년 7월 8일 오후 3시'),
                      )),
                      Container(
                        margin: EdgeInsets.only(right: 8),
                        child: IconButton(
                          iconSize: 28,
                          icon: Icon(Icons.check_box_outline_blank),
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
