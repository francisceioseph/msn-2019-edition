import 'package:flutter/material.dart';
import 'package:messanger/src/screens/main_page.dart';
import 'package:messanger/src/themes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Messenger',
      theme: kLightTheme,
      darkTheme: kDarkTheme,
      onGenerateRoute: _routes,
    );
  }

  Route _routes(RouteSettings settings) {
    return MaterialPageRoute(builder: (BuildContext context) {
      return MainPage();
    });
  }
}
