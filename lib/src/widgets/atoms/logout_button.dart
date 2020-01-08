import 'dart:async';

import 'package:flutter/material.dart';
import 'package:messanger/src/blocs/app_bloc_provider.dart';
import 'package:messanger/src/blocs/auth_bloc.dart';
import 'package:messanger/src/widgets/templates/loading_dialog.dart';

class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthBloc bloc = AppBlocProvider.of(context).authBloc;

    return Container(
      margin: EdgeInsets.only(
        top: 24,
      ),
      child: ListTile(
        title: OutlineButton(
          child: Text(
            'Sign Out',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          color: Colors.red,
          textColor: Colors.red,
          borderSide: BorderSide(
            color: Colors.red,
          ),
          onPressed: () {
            StreamSubscription subscription;

            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return LoadingDialog();
              },
            );

            subscription = bloc.user.listen((user) {
              if (user == null) {
                subscription.cancel();

                Navigator.of(context).pushNamedAndRemoveUntil(
                  '/',
                  (_) => false,
                );
              }
            });

            bloc.logout();
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
