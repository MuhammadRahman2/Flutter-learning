import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning/slider_with_switch/block_slider/slider_bloc.dart';
import 'package:flutter_learning/slider_with_switch/block_slider/slider_event.dart';
import 'package:flutter_learning/slider_with_switch/block_slider/slider_state.dart';
class SliderView extends StatelessWidget {
  const SliderView({super.key});

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<SliderBloc,SliderState>(
            buildWhen: (previous, current) => previous.isSwitch != current.isSwitch,
              builder: (context, state) {
                print('switch');
                return Switch(
                  value: state.isSwitch!,
                  onChanged: (value) {
                    context.read<SliderBloc>().add(SwitchValueChange());
                  },
                );
              },
            ),
            BlocBuilder<SliderBloc,SliderState>(
              buildWhen: (previous, current) => previous.sliderValue != current.sliderValue,
              builder: (context, state) {
                print('slider');
              return Slider(
                  value: state.sliderValue!.toDouble(),
                  onChanged:  (double newValue) {
                    context.read<SliderBloc>().add(SliderValueChange(newValue: newValue));
                  },
              );
            },),
          ],
        ),
      ),
    );
  }
}
