import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning/add_in_list/list_bloc/list_bloc.dart';
import 'package:flutter_learning/add_in_list/list_view.dart';
import 'package:flutter_learning/counter/counter_bloc/counter_bloc.dart';
import 'package:flutter_learning/counter/view/counter_view.dart';
import 'package:flutter_learning/slider_with_switch/block_slider/slider_bloc.dart';


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
         BlocProvider(create: (context) => CounterBloc(), ),
        BlocProvider(create: (context) =>  SliderBloc(),),
        BlocProvider(create: (context) => ListBloc(),),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: ListViewScreen(),
      ),
    );
  }
}
