import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_app/models/todo.dart';

import '../providers/todos_provider.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;

  TodoItem({required this.todo});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todo.title!),
      trailing: Checkbox(
        value: todo.isCompleted,
        onChanged: (value) {
          Provider.of<TodosProvider>(context, listen: false).toggleTodo(todo);
        },
      ),
    );
  }
}
