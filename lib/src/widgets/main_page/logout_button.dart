import 'package:flutter/material.dart';
import 'package:messanger/src/blocs/login/bloc.dart';
import 'package:messanger/src/blocs/login/provider.dart';

class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthBloc bloc = AuthProvider.of(context);

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
            bloc.logout();
            Navigator.of(context).pushReplacementNamed('/login');
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
