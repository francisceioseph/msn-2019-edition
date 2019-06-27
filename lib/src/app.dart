import 'package:flutter/material.dart';
import 'package:messanger/guards/auth_guard.dart';
import 'package:messanger/src/blocs/login/provider.dart';
import 'package:messanger/src/screens/loading.dart';
import 'package:messanger/src/screens/login.dart';
import 'package:messanger/src/screens/main_page.dart';
import 'package:messanger/src/themes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
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
      return MaterialPageRoute(
        builder: (BuildContext context) {
          return AuthGuard(
            loadingScreen: LoadingScreen(),
            unauthenticatedHandler: (BuildContext context) =>
                Navigator.of(context).pushReplacementNamed('/login'),
            authenticationStream: Provider.of(context).user.map(
                  (user) => user.name == null
                      ? AuthGuardStatus.notAuthenticated
                      : AuthGuardStatus.authenticated,
                ),
            child: DefaultTabController(
              length: 3,
              child: MainPage(),
            ),
          );
        },
      );
    }

    return MaterialPageRoute(
      builder: (BuildContext context) {
        return Login();
      },
    );
  }
}
