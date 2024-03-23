import '../models/todo.dart';

class TodoController {
  List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  void addTodo(Todo todo) {
    _todos.add(todo);
  }

  void updateTodo(Todo todo) {
    final index = _todos.indexWhere((t) => t.id == todo.id);
    if (index != -1) {
      _todos[index] = todo;
    }
  }

  void deleteTodo(Todo todo) {
    _todos.removeWhere((t) => t.id == todo.id);
  }

  Future<List<Todo>> fetchTasks() async {
    // Simulate fetching tasks from a data source (e.g., database, API)
    await Future.delayed(Duration(seconds: 1));
    return [
      Todo(
        id: 1,
        title: 'Buy groceries',
        description: 'Milk, eggs, bread, and vegetables',
        dueDate: DateTime.now().add(Duration(days: 2)),
      ),
      Todo(
        id: 2,
        title: 'Finish project report',
        description: 'Write the conclusion and submit the report',
        dueDate: DateTime.now().add(Duration(days: 4)),
        isCompleted: true,
      ),
      Todo(
        id: 3,
        title: 'Go for a run',
        description: '30 minutes of jogging',
        dueDate: DateTime.now().add(Duration(days: 1)),
      ),
    ];
  }
}