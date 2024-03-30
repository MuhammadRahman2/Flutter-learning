import 'package:flutter_learning/core/entities/task.dart';

abstract class TaskRepository {
  Future<void> addTask(Task task);
  Future<List<Task>> getTasks();
  Future<void> updateTask(Task task);
  Future<void> deleteTask(int taskId);
}