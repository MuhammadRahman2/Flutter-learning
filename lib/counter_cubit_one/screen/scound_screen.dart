import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning/counter_cubit_one/cubit/counter_cubit.dart';

class SecoundScreen extends StatelessWidget {
  const SecoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterCubit>(context);
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,

        children: [
          FloatingActionButton(
            onPressed: (){
              counterBloc.incrementValue();
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: (){
              counterBloc.decrementValue();
            },
            child: const Icon(Icons.minimize),
          ),
        ],
      ),
    );
  }
}
