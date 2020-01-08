import 'package:flutter/material.dart';
import 'package:messanger/src/blocs/app_bloc_provider.dart';
import 'package:messanger/src/blocs/auth_bloc.dart';
import 'package:messanger/src/models/chat_page_arguments.dart';
import 'package:messanger/src/widgets/atoms/loader.dart';
import 'package:messanger/src/widgets/pages/chat_page.dart';
import 'package:messanger/src/widgets/pages/home.dart';
import 'package:messanger/src/widgets/pages/login.dart';
import 'package:messanger/src/widgets/pages/main_page.dart';
import 'package:messanger/src/widgets/pages/register.dart';
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
      return MaterialPageRoute(
        builder: (BuildContext context) {
          final AuthBloc authBloc = AppBlocProvider.of(context).authBloc;

          return StreamBuilder(
            initialData: false,
            stream: authBloc.user.map((user) => user != null ? true : false),
            builder: (BuildContext context, AsyncSnapshot<bool> snap) {
              if (!snap.hasData) {
                return LoadingIndicator();
              }

              if (snap.hasError) {
                return Home();
              }

              return snap.data == true ? MainPage() : Home();
            },
          );
        },
      );
    }

    if (settings.name == '/login') {
      return MaterialPageRoute(
        builder: (BuildContext context) {
          return Login();
        },
      );
    }

    if (settings.name == ChatPage.routeName) {
      return MaterialPageRoute(
        builder: (context) {
          final ChatPageArguments args = settings.arguments;

          return ChatPage(
            conversation: args.conversation,
          );
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
