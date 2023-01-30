import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/todo.dart';
import '../providers/todos_provider.dart';
import 'add_todo_screen.dart';

class TodoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List"),
      ),
      body: Consumer<TodosProvider>(
        builder: (context, todosProvider, child) {
          return ListView.builder(
            itemCount: todosProvider.todos.length,
            itemBuilder: (BuildContext context, int index) {
              Todo todo = todosProvider.todos[index];
              return CheckboxListTile(
                value: todo.isCompleted,
                onChanged: (bool? value) {
                  todo.isCompleted = value;
                  todosProvider.updateTodo(todo);
                },
                title: Text(todo.title!),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AddTodoScreen())
            ),
        child: Icon(Icons.add),
      ),
    );
  }
}
