import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class SliderCubit extends Cubit<double>{
  SliderCubit(): super(0.1);

  void opacityChange(double value){
    emit(value);
    debugPrint(state.toString());
  }

}