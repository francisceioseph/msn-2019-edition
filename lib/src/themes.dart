import 'package:flutter/material.dart';

final kLightTheme = ThemeData(
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(
    color: Colors.white,
  ),
  buttonColor: Colors.blue,
  primaryIconTheme: IconThemeData(
    color: Colors.black,
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
      body1: TextStyle(
        color: Colors.black87,
      )),
);

final kDarkTheme = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(),
  buttonColor: Colors.blue,
  primaryIconTheme: IconThemeData(
    color: Colors.white,
  ),
  primaryTextTheme: TextTheme(
      title: TextStyle(
        color: Colors.white,
      ),
      subtitle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Colors.white70,
      ),
      body1: TextStyle(
        color: Colors.white70,
      )),
);
