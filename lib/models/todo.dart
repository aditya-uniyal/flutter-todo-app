class Todo {
  int id;
  String title;
  String description;
  DateTime dueDate;
  bool isCompleted;

  Todo({
    required this.id,
    required this.title,
    required this.description,
    required this.dueDate,
    this.isCompleted = false,
  });

  void toggleCompletion() {
    isCompleted = !isCompleted;
  }

// Other methods...
}