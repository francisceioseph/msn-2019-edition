import 'package:flutter/material.dart';
import 'package:messanger/src/blocs/app_bloc_provider.dart';
import 'package:messanger/src/routes/main_route.dart';
import 'package:messanger/src/screens/login.dart';
import 'package:messanger/src/screens/register.dart';
import 'package:messanger/src/themes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBlocProvider(
      child: MaterialApp(
        title: 'Messenger',
        theme: kLightTheme,
        darkTheme: kDarkTheme,
        initialRoute: '/',
        onGenerateRoute: _routes,
      ),
    );
  }

  Route _routes(RouteSettings settings) {
    if (settings.name == '/') {
      return MainRoute.build();
    }

    if (settings.name == '/login') {
      return MaterialPageRoute(
        builder: (BuildContext context) {
          return Login();
        },
      );
    }

    return MaterialPageRoute(
      builder: (BuildContext context) {
        return Register();
      },
    );
  }
}
