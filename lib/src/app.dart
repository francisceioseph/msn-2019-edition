import 'package:flutter/material.dart';
import 'package:messanger/src/blocs/app_bloc_provider.dart';
import 'package:messanger/src/routes/main_route.dart';
import 'package:messanger/src/screens/login.dart';
import 'package:messanger/src/themes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBlocProvider(
      child: MaterialApp(
        title: 'Messenger',
        theme: kLightTheme,
        darkTheme: kDarkTheme,
        initialRoute: '/login',
        onGenerateRoute: _routes,
      ),
    );
  }

  Route _routes(RouteSettings settings) {
    if (settings.name == '/') {
      return MainRoute.build();
    }

    return MaterialPageRoute(
      builder: (BuildContext context) {
        return Login();
      },
    );
  }
}
