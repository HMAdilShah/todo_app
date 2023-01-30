import 'package:flutter/widgets.dart';

import '../models/todo.dart';

class TodosProvider with ChangeNotifier {
  List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void toggleTodo(Todo todo) {
    final todoIndex = _todos.indexOf(todo);
    _todos[todoIndex].isCompleted = _todos[todoIndex].isCompleted;
    notifyListeners();
  }

  void deleteTodo(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  void updateTodo(Todo updatedTodo) {
    int index = _todos.indexWhere((todo) => todo.id == updatedTodo.id);
    _todos[index] = updatedTodo;
    notifyListeners();
  }
}
