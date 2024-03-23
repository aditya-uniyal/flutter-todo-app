import 'package:flutter/foundation.dart';

class Todo {
  final int? id;
  final String title;
  final String description;
  final DateTime dueDate;
  bool isCompleted;

  Todo({
    this.id,
    required this.title,
    required this.description,
    required this.dueDate,
    this.isCompleted = false,
  });

  Todo.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        title = map['title'],
        description = map['description'],
        dueDate = DateTime.parse(map['dueDate']),
        isCompleted = map['isCompleted'] == 1;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dueDate': dueDate.toIso8601String(),
      'isCompleted': isCompleted ? 1 : 0,
    };
  }

  void toggleCompletion() {
    isCompleted = !isCompleted;
  }

  @override
  String toString() {
    return 'Todo{id: $id, title: $title, description: $description, dueDate: $dueDate, isCompleted: $isCompleted}';
  }
}