import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class CounterCubit extends Cubit<int>{
  CounterCubit() : super(0);

  void incrementValue(){
    emit(state + 1);
    debugPrint(state.toString());
  }

  void decrementValue(){
    if (state == 0){
      return;
    }
    emit(state -1);
    debugPrint(state.toString());
  }

}