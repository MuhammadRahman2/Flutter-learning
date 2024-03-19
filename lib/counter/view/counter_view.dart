import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning/counter/counter_bloc/counter_bloc.dart';
import 'package:flutter_learning/counter/counter_bloc/counter_state.dart';
import '../counter_bloc/bloc_event.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      body:  Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc,CounterState>(
              builder: (context, state) {
                return Text(state.counter.toString(),style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w700),);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton(
                  child: const Text('Subtract'),
                  onPressed: () {
                    context.read<CounterBloc>().add(DecrementCounter());
                  },
                ),
                CupertinoButton(
                  child: const Text('Reset'),
                  onPressed: () {
                    context.read<CounterBloc>().add(ResetCounter());
                  },
                ),
                CupertinoButton(
                  child: const Text('Add'),
                  onPressed: () {
                    context.read<CounterBloc>().add(IncrementCounter());
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
