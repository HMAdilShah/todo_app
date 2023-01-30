import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/todo.dart';
import '../providers/todos_provider.dart';


class AddTodoScreen extends StatefulWidget {
  @override
  _AddTodoScreenState createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Todo"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: "Title",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter a title";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: "Description",
                ),
              ),
              SizedBox(height: 16),
              RaisedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final todo = Todo(
                      title: _titleController.text,
                      description: _descriptionController.text,
                      isCompleted: false
                    );
                    Provider.of<TodosProvider>(context, listen: false)
                        .addTodo(todo);
                    Navigator.of(context).pop();
                  }
                },
                child: Text("Add Todo"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
