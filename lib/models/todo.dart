import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

final uuid = Uuid();
class Todo {
  final String? title;
  final String? description;
  bool? isCompleted;
  final String? id;

  Todo({
    @required this.title,
    @required this.description,
    @required this.isCompleted,
  }) : id = Uuid().v1();
}
