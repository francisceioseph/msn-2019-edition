import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:messanger/src/blocs/app_bloc_provider.dart';
import 'package:messanger/src/blocs/user_bloc.dart';
import 'package:messanger/src/widgets/atoms/loader.dart';

class UserStreamBuilder extends StatelessWidget {
  final Widget Function(BuildContext, Map<String, dynamic>) builder;
  final String userId;

  UserStreamBuilder({
    Key key,
    @required this.userId,
    @required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UsersBloc usersBloc = AppBlocProvider.of(context).usersBloc;

    usersBloc.fetchUser(userId);

    return StreamBuilder(
      stream: usersBloc.users,
      builder: (
        BuildContext context,
        AsyncSnapshot<Map<String, Stream<DocumentSnapshot>>> snap,
      ) {
        if (snap.hasData) {
          return StreamBuilder(
            stream: snap.data[this.userId],
            builder: (
              BuildContext context,
              AsyncSnapshot<DocumentSnapshot> docSnap,
            ) {
              if (docSnap.hasData) {
                return this.builder(context, docSnap.data.data);
              }

              return LoadingIndicator();
            },
          );
        }

        if (snap.hasError) {
          return Text(snap.error.toString());
        }

        return LoadingIndicator();
      },
    );
  }
}
