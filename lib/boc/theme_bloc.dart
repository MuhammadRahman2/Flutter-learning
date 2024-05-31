// lib/theme_bloc.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning/global/theme/app_thmes.dart';

// Events
abstract class ThemeEvent {}

class ToggleTheme extends ThemeEvent {}

// States
class ThemeState {
  final ThemeData themeData;
  ThemeState({required this.themeData});
}

// Bloc
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(themeData: lightTheme)) {
    on<ToggleTheme>((event, emit) {
      if (state.themeData == lightTheme) {
        emit(ThemeState(themeData: darkTheme));
      } else {
        emit(ThemeState(themeData: lightTheme));
      }
    });
  }
}
