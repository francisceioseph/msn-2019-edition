import 'package:flutter/material.dart';
import 'app_bloc.dart';

class AppBlocProvider extends InheritedWidget {
  final bloc = AppBloc();

  AppBlocProvider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static AppBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppBlocProvider>().bloc;
  }
}
