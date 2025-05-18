import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/todolistprovider.dart';
import 'package:todo/screens/todo_list_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ToDoList(),
      child: MaterialApp(home: ToDoListScreen()),
    ),
  );
}
