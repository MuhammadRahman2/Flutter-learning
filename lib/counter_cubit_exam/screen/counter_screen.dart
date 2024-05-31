import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning/counter_cubit_exam/cubit/counter_cubit.dart';
import 'package:flutter_learning/counter_cubit_exam/screen/scound_screen.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterCubit>(context);
    return Scaffold(
      body: BlocBuilder(
        bloc: counterBloc, //this parameter is option if you are not put tag <CounterCubit, int> then you need to put
         builder:  (context, state) =>
          Center(child: Text('value is : ${state}')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>Navigator.push(context, MaterialPageRoute(
          builder: (context)=> const SecoundScreen(),),),
        child: const  Icon(Icons.navigate_next),
      )
    );
  }
}
