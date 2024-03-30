import 'package:flutter/material.dart';
import 'package:flutter_learning/core/repositories/task_respository.dart';
import 'package:flutter_learning/core/repositories/task_respository_impl.dart';
import 'package:flutter_learning/core/usecases/task_usecase_imp.dart';
import 'package:flutter_learning/core/usecases/task_usecases.dart';
import 'package:flutter_learning/data/sqlite/db_helper.dart';
import 'package:flutter_learning/presentation/screens/task_list_screen.dart';
import 'package:flutter_learning/presentation/screens/task_list_screen_simple.dart';
import 'package:get_it/get_it.dart';
// final getIt = GetIt.instance;
// void setup() {
//   getIt.registerSingleton<TaskRepository>(TaskRepositoryImpl(DatabaseHelper.instance));
//   getIt.registerSingleton<TaskUseCase>(TaskUseCaseImpl(getIt<TaskRepository>()));
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:MyHomePage()
      // TaskListScreen()
    );
  }
}
