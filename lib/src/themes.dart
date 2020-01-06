import 'package:flutter/material.dart';

final kLightTheme = ThemeData(
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(
    color: Colors.white,
  ),
  primaryTextTheme: TextTheme(
    title: TextStyle(
      color: Colors.black,
    ),
    subtitle: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: Colors.blue,
    ),
  ),
);

final kDarkTheme = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(),
  buttonColor: Colors.blue,
  primaryTextTheme: TextTheme(
    title: TextStyle(
      color: Colors.white,
    ),
    subtitle: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: Colors.white70,
    ),
  ),
);
