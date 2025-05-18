import 'package:flutter/material.dart';

import '../model/todo_data.dart';

class AddToDoScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String _title = "";
  String _notes = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("To Do List"), centerTitle: true),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Title'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a title';
                }
                return null;
              },
              onSaved: (value) {
                _title = value!.trim();
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Notes'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a note';
                }
                return null;
              },
              onSaved: (value) {
                _notes = value!.trim();
              },
            ),
            ElevatedButton(
              onPressed: () {
                _onSave(context);
              },
              child: Text("Save"),
            ),
          ],
        ),
      ),
    );
  }

  void _onSave(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final todo = ToDoItem(DateTime.now().toString(), _title, _notes);
      Navigator.pop(context, todo);
    }
  }
}
