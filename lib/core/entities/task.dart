// task.dart

class Task {
  int? id;
  String? name;
  bool? completed;

  Task({this.id, this.name, this.completed});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'completed': completed! ? 1 : 0,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      name: map['name'],
      completed: map['completed'] == 1,
    );
  }
}
