import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning/timer_cubit/timer_cubit.dart';

class TimerCubitView extends StatelessWidget {
  const TimerCubitView({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timer'),
      ),
      body: Center(
        child: BlocBuilder<TimerCubit, TimerState>(
          builder: (context, state) {
            if (state is TimerRunning) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: LinearProgressIndicator(value: state.progress),
              );
            } else if (state is TimerComplete) {
              return const Text(
                "Timer Complete",
                style: TextStyle(fontSize: 40),
              );
            } else {
              return const Text(
                "Starting Timer...",
                style: TextStyle(fontSize: 40),
              );
            }
          },
        ),
      ),
    );
  }
}
