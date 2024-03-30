// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_learning/core/entities/task.dart';
import 'package:flutter_learning/data/sqlite/db_helper.dart';



class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final dbHelper = DatabaseHelper.instance;
  late Future<List<Task>> taskListFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _refreshTaskList();
  }

  void _refreshTaskList() {
    // Fetch tasks from the database and update taskListFuture
    setState(() {
      taskListFuture = dbHelper.getTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter SQFlite Demo'),
      ),
      body: FutureBuilder<List<Task>>(
        future: taskListFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No tasks found.'));
          } else {
            final tasks = snapshot.data;
            return ListView.builder(
              itemCount: tasks!.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return ListTile(
                  title: Text(task.name.toString()),
                  trailing: Checkbox(
                    value: task.completed,
                    onChanged: (value) {
                      setState(() {
                        task.completed = value;
                        dbHelper.updateTask(task);
                        _refreshTaskList();
                      });
                    },
                  ),
                  onLongPress: () async {
                    await dbHelper.deleteTask(task.id!);
                    // Refresh the task list to reflect the changes
                    _refreshTaskList();
                  },
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addTaskDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _addTaskDialog(BuildContext context) async {
    String taskName = '';
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Task'),
          content: TextField(
            autofocus: true,
            onChanged: (value) {
              taskName = value;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                if (taskName.isNotEmpty) {
                  Task newTask = Task(name: taskName, completed: false);
                  await dbHelper.insertTask(newTask);
                  setState(() {});
                  _refreshTaskList();
                  Navigator.pop(context);
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
