// database_helper.dart

import 'package:flutter_learning/core/entities/task.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const String tableName = 'tasks';
  static const String databaseName = 'tasks.db';
  static const String columnId = 'id';
  static const String columnName = 'name';
  static const String columnCompleted = 'completed';
  static final DatabaseHelper instance = DatabaseHelper._internal();
  DatabaseHelper._internal();

  static Database? _database;
  factory DatabaseHelper() => instance;



  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }


  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), databaseName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          """CREATE TABLE $tableName (
          $columnId INTEGER PRIMARY KEY AUTOINCREMENT, 
          $columnName TEXT,
          $columnCompleted INTEGER
        )""",
        );
      },
    );
  }

  Future<void> insertTask(Task task) async {
    final db = await database;
    await db.insert(tableName, task.toMap());
        // conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Task>> getTasks() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(tableName);
    return List.generate(maps.length, (i) {
      return Task.fromMap(maps[i]);
    });
  }

  Future<void> updateTask(Task task) async {
    final db = await database;
    await db.update(tableName, task.toMap(),
        where: 'id = ?', whereArgs: [task.id]);
  }

  Future<void> deleteTask(int id) async {
    final db = await database;
    await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }

}
