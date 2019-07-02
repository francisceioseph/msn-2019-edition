import 'package:flutter/material.dart';
import 'package:messanger/src/blocs/app_bloc_provider.dart';
import 'package:messanger/src/blocs/login/bloc.dart';
import 'package:messanger/src/guards/guarded_route.dart';
import 'package:messanger/src/screens/loading.dart';
import 'package:messanger/src/screens/main_page.dart';

class MainRoute {
  static Route build() {
    return MaterialPageRoute(
      builder: (BuildContext context) {
        return GuardedRoute(
          loadingScreen: LoadingScreen(),
          onCannotForward: _onCannotForward,
          forwardValidationStream: _forwardRouteStream(context),
          child: DefaultTabController(
            length: 3,
            child: MainPage(),
          ),
        );
      },
    );
  }

  static Stream<GuardedRouteStatus> _forwardRouteStream(BuildContext context) {
    AuthBloc authBloc = AppBlocProvider.of(context).authBloc;

    return authBloc.user.map(
      (user) => user == null
          ? GuardedRouteStatus.cannotForward
          : GuardedRouteStatus.canForward,
    );
  }

  static void _onCannotForward(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/login');
  }
}
