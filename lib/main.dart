import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning/counter_cubit_one/cubit/counter_cubit.dart';
import 'package:flutter_learning/slider_cubit_two/slider_cubit.dart';
import 'package:flutter_learning/slider_cubit_two/slider_cubit_view.dart';
import 'package:flutter_learning/switch_change_cubit/switch_cubit.dart';
import 'package:flutter_learning/switch_change_cubit/switch_cubit_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterCubit(),),
        BlocProvider(create: (context) =>  SliderCubit(),),
        BlocProvider(create: (context) => SwitchCubit(),)
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SwitchCubitView(),
        // SliderCubitView(),
        // CounterScreen(),
      ),
    );
  }
}
