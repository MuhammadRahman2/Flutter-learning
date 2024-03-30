// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:flutter_learning/core/entities/task.dart'; // Assuming your Task entity definition
// import 'package:flutter_learning/core/usecases/task_usecases.dart';
// import 'package:flutter_learning/main.dart';
// import 'package:get_it/get_it.dart'; // For dependency injection
//
// class TaskListScreen extends StatefulWidget {
//   const TaskListScreen({super.key});
//
//   @override
//   State<TaskListScreen> createState() => _TaskListScreenState();
// }
//
// class _TaskListScreenState extends State<TaskListScreen> {
//   final _taskUseCase = getIt<TaskUseCase>(); // Access TaskUseCase using getIt
//
//   List<Task> _tasks = [];
//   final _formKey = GlobalKey<FormState>();
//   final _taskController = TextEditingController();
//   final _random = Random();
//
//   @override
//   void initState() {
//     super.initState();
//     // Call setup() indirectly to ensure dependencies are configured before initState
//     // setup(); // This assumes setup() is defined in a parent widget or a utility function
//     _getTasks(); // Fetch tasks on app launch
//   }
//
//   void _addTask() async {
//     if (_formKey.currentState!.validate()) {
//       final task = Task(
//           id: _random.nextInt(100000), // Generate random ID (adjust range as needed)
//           title: _taskController.text,
//           completed: false);
//       await _taskUseCase.addTask(task); // Add task using TaskUseCase
//       _getTasks(); // Refresh the task list
//       _taskController.text = ''; // Clear text field after adding
//     }
//   }
//
//   void _getTasks() async {
//     final tasks = await _taskUseCase.getTask(); // Get tasks using TaskUseCase
//     setState(() {
//       _tasks = tasks;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Sqlite Crud'),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Form(
//               key: _formKey,
//               child: TextFormField(
//                 controller: _taskController,
//                 decoration: const InputDecoration(labelText: 'Title'),
//                 validator: (value) => value!.isEmpty ? 'Please enter a title' : null,
//               ),
//             ),
//           ),
//           ElevatedButton(
//             onPressed: _addTask, // Call _addTask on button press
//             child: Text('Add Data'),
//           ),
//           SizedBox(),
//           Expanded(
//             child: ListView.builder(
//               itemCount: _tasks.length,
//               itemBuilder: (context, index) {
//                 final task = _tasks[index];
//                 return ListTile(
//                   title: Text(task.title),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
