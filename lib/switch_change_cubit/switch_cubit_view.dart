
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning/switch_change_cubit/switch_cubit.dart';

class SwitchCubitView extends StatefulWidget {
   SwitchCubitView({super.key});

  @override
  State<SwitchCubitView> createState() => _SwitchCubitViewState();
}

class _SwitchCubitViewState extends State<SwitchCubitView> {
  bool isSwitchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:  const Text('Switch cubit'),),
      body: Column(
        children: [
          BlocBuilder<SwitchCubit,bool>(
            builder: (context, state) {
            return Switch(value: state , onChanged: (value) => context.read<SwitchCubit>().changeSwitchValue() );
          },
          )

      ],
      )
    );
  }
}
