import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/todo.dart';

class TodoController {
  Database? _database;


  Future<void> init() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'todo_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE todos(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT, dueDate TEXT, isCompleted INTEGER)',
        );
      },
      version: 1,
    );
  }

  Future<bool> isInitialized() async {
    return _database != null;
  }

  Future<List<Todo>> fetchTasks() async {
    if (_database == null) {
      throw Exception('Database not initialized');
    }

    final List<Map<String, dynamic>> maps = await _database!.query('todos');
    return List.generate(maps.length, (i) {
      return Todo.fromMap(maps[i]);
    });
  }

  Future<void> addTodo(Todo todo) async {
    if (_database == null) {
      throw Exception('Database not initialized');
    }

    await _database!.insert(
      'todos',
      todo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateTodo(Todo todo) async {
    if (_database == null) {
      throw Exception('Database not initialized');
    }

    await _database!.update(
      'todos',
      todo.toMap(),
      where: 'id = ?',
      whereArgs: [todo.id],
    );
  }

  Future<void> deleteTodo(Todo todo) async {
    if (_database == null) {
      throw Exception('Database not initialized');
    }

    await _database!.delete(
      'todos',
      where: 'id = ?',
      whereArgs: [todo.id],
    );
  }
  // Add a toMap() method to the Todo model
}