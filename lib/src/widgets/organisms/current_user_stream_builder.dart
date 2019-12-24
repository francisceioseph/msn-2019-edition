import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messanger/src/blocs/app_bloc_provider.dart';
import 'package:messanger/src/blocs/auth_bloc.dart';
import 'package:messanger/src/widgets/atoms/loader.dart';

class CurrentUserStreamBuilder extends StatelessWidget {
  final Widget Function(BuildContext, FirebaseUser) builder;

  CurrentUserStreamBuilder({
    @required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    AuthBloc bloc = AppBlocProvider.of(context).authBloc;

    return StreamBuilder(
      stream: bloc.user,
      builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snap) {
        if (snap.hasData) {
          return this.builder(context, snap.data);
        }

        if (snap.hasError) {
          return Text(snap.error);
        }

        return LoadingIndicator();
      },
    );
  }
}
