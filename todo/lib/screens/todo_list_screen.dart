import 'package:flutter/material.dart';
import 'package:todo/model/todo_data.dart';
import 'package:todo/screens/add_todo_screen.dart';

class ToDoListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ToDoListScreenState();
  }
}

class ToDoListScreenState extends State<ToDoListScreen> {
  final List<ToDoItem> toDoItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("To Do List"), centerTitle: true),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _onAddToDo(context);
        },
        child: Icon(Icons.add),
      ),
      body:
          toDoItems.isEmpty
              ? Center(child: Text("Add items to do list"))
              : ListView.builder(
                itemCount: toDoItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(toDoItems[index].title),
                    subtitle: Text(toDoItems[index].notes),
                  );
                },
              ),
    );
  }

  void _onAddToDo(BuildContext context) async {
    final ToDoItem todo = await Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => AddToDoScreen()));
    setState(() {
      toDoItems.add(todo);
    });
  }
}
