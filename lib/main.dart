import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/providers/todos_provider.dart';
import 'package:todo_app/screens/todo_list_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TodosProvider>(
      create: (context) => TodosProvider(),
      child: MaterialApp(
        home: TodoListScreen(),
      ),
    );
  }
}
