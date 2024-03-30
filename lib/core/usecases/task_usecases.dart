import 'package:flutter_learning/core/entities/task.dart';

abstract class TaskUseCase{
  Future<void> addTask(Task task);
  Future<List<Task>> getTask();
  Future<void> updateTask(Task task);
  Future<void> deleteTask(int taskId);

}