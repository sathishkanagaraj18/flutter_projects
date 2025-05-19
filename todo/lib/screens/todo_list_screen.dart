import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/todo_data.dart';
import 'package:todo/provider/todolistprovider.dart';
import 'package:todo/screens/add_todo_screen.dart';

class ToDoListScreen extends StatelessWidget {
  final List<ToDoItem> toDoItems = [];

  @override
  Widget build(BuildContext context) {
    final todos = context.watch<ToDoList>();
    final todoList = todos.todos;
    return Scaffold(
      appBar: AppBar(title: Text("To Do List"), centerTitle: true),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _onAddToDo(context, "add");
        },
        child: Icon(Icons.add),
      ),
      body:
          todoList.isEmpty
              ? Center(child: Text("No To Do Items Added"))
              : ListView.builder(
                itemCount: todoList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(todoList[index].title),
                    subtitle: Text(todoList[index].notes),
                    onTap: () {
                      _onAddToDo(context, "update", item: todoList[index]);
                    },
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        context.read<ToDoList>().delete(todoList[index].id);
                      },
                    ),
                  );
                },
              ),
    );
  }

  void _onAddToDo(BuildContext context, String fromScreen, {ToDoItem? item}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (context) => AddToDoScreen(fromScreen: fromScreen, toDoItem: item),
      ),
    );
  }
}
