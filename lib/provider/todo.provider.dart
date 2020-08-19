import 'package:flurry/model/todo.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class TodoProvider with ChangeNotifier {
  List<Todo> _todoList = [];
  List<Todo> get todoList => _todoList;

  void addTodo(Todo todo) {
    _todoList.add(todo);
    notifyListeners();
  }

  void removeTodo(int index) {
    _todoList.removeAt(index);
    notifyListeners();
  }
}
