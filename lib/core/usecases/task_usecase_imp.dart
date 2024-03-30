import 'package:flutter_learning/core/entities/task.dart';
import 'package:flutter_learning/core/repositories/task_respository.dart';
import 'package:flutter_learning/core/usecases/task_usecases.dart';

class TaskUseCaseImpl extends TaskUseCase{

  final TaskRepository _taskRepository;

  TaskUseCaseImpl(this._taskRepository);

  @override
  Future<void> addTask(Task task) => _taskRepository.addTask(task);

  @override
  Future<List<Task>> getTask() => _taskRepository.getTasks();

  @override
  Future<void> deleteTask(int taskId) => _taskRepository.deleteTask(taskId);

  @override
  Future<void> updateTask(Task task) => _taskRepository.updateTask(task);

}