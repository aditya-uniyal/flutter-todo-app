// todo_list_screen.dart
import 'package:demo_project/views/todo_form_screen.dart';
import 'package:flutter/material.dart';

import '../controllers/todo_controller.dart';
import '../models/todo.dart';

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final TodoController _controller = TodoController();
  List<Todo> _tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    _tasks = await _controller.fetchTasks();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          final todo = _tasks[index];
          return ListTile(
            title: Text(todo.title),
            subtitle: Text(todo.description),
            trailing: Checkbox(
              value: todo.isCompleted,
              onChanged: (value) {
                todo.toggleCompletion();
                _controller.updateTodo(todo);
                setState(() {});
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TodoFormScreen(onTodoAdded: _handleTodoAdded)),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _handleTodoAdded(Todo todo) {
    _tasks.add(todo);
    setState(() {});
  }
}