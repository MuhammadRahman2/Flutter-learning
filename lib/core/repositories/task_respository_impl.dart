import 'package:flutter_learning/core/entities/task.dart';
import 'package:flutter_learning/core/repositories/task_respository.dart';
import 'package:flutter_learning/data/sqlite/db_helper.dart';

class TaskRepositoryImpl extends TaskRepository{
  final DatabaseHelper _databaseHelper;

  TaskRepositoryImpl(this._databaseHelper);

  @override
  Future<void> addTask(Task task) => _databaseHelper.insertTask(task);

  @override
  Future<List<Task>> getTasks() => _databaseHelper.getTasks();

  @override
  Future<void> deleteTask(int taskId) => _databaseHelper.deleteTask(taskId);

  @override
  Future<void> updateTask(Task task) => _databaseHelper.updateTask(task);

}