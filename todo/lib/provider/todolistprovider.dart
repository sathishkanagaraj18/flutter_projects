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

  void updateTodo(String id, String updatedTitle, String updatedNotes) {
    final index = _toDoItemsList.indexWhere((t) => t.id == id);
    _toDoItemsList[index] = ToDoItem(id, updatedTitle, updatedNotes);
    notifyListeners();
  }

  void delete(String id) {
    _toDoItemsList.removeWhere((t) => t.id == id);
    notifyListeners();
  }
}
