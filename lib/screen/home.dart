import 'dart:convert';

import 'package:flurry/model/todo.model.dart';
import 'package:flurry/provider/todo.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

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
    return Scaffold(
        body: ListView(
      children: [
        Container(
            height: 50,
            child: const Center(
              child: Text('Hello, World!'),
            )),
        RaisedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
        ),
        RaisedButton(
          onPressed: () {
            this.fetchTodo(context);
          },
          child: Text('fetch'),
        ),
        Text('정현승 이라고 합니다. My Name is Daniel.',
            style: TextStyle(
              fontSize: 30,
            )),
        ListBody(
          children: context
              .watch<TodoProvider>()
              .todoList
              .map((e) => Text(e.title))
              .toList(),
        )
      ],
    ));
  }
}
