import 'package:flutter/foundation.dart';
import 'package:todo/model/todo_data.dart';

class ToDoList extends ChangeNotifier {
  final List<ToDoItem> _toDoItemsList = [];

  List<ToDoItem> get todos => _toDoItemsList;

  void addTodo(String title, String notes) {
    final todo = ToDoItem(DateTime.now().toIso8601String(), title, notes);
    _toDoItemsList.add(todo);
    notifyListeners();
  }
}
