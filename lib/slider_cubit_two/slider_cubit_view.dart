import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning/slider_cubit_two/slider_cubit.dart';

class SliderCubitView extends StatelessWidget {
   SliderCubitView({super.key});


  @override
  Widget build(BuildContext context) {
    final sliderCubit = BlocProvider.of<SliderCubit>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Slider Change'),
      ),
      body: BlocBuilder<SliderCubit,double>(
        builder: (context, sliderValue) {
          return Column(
            children: [
              Container(
                height: 200,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.purple.withOpacity(sliderValue)
                ),
              ),
              Slider(value: sliderValue,
                  onChanged: (value)=> context.read<SliderCubit>().opacityChange(value)
                  )
            ],
          );
        }
      )
    );
  }
}
