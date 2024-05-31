// lib/app_themes.dart
import 'package:flutter/material.dart';

// Light Theme
final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  hintColor: Colors.blueAccent,
  appBarTheme: const AppBarTheme(
    color: Colors.blue,
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.blue,
    textTheme: ButtonTextTheme.primary,
  ),
  textTheme: const TextTheme(
    titleMedium: TextStyle(color: Colors.white), // For app bar titles
    bodyMedium: TextStyle(color: Colors.white), // For regular text
  ),

);

// Dark Theme
final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.black,
  hintColor: Colors.lightBlueAccent,
  appBarTheme: const AppBarTheme(
    color: Colors.black,
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.blueAccent,
    textTheme: ButtonTextTheme.primary,
  ),
  textTheme: const TextTheme(
    titleMedium: TextStyle(color: Colors.white), // For app bar titles
    bodyMedium: TextStyle(color: Colors.white), // For regular text
  ),
);
