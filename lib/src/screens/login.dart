import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messanger/src/blocs/app_bloc_provider.dart';
import 'package:messanger/src/blocs/auth_bloc.dart';
import 'package:messanger/src/widgets/login/app_bar.dart';
import 'package:messanger/src/widgets/logo_image.dart';
import 'package:messanger/src/widgets/welcome_section.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = AppBlocProvider.of(context).authBloc;

    return Scaffold(
      appBar: AppBar(
        title: LoginAppBar(),
      ),
      body: Container(
        padding: EdgeInsets.only(
          right: 16,
          left: 16,
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                LogoImage(),
                WelcomeSection(
                  welcomeText:
                      'Sign in with your Windows Live ID. Dont have one?',
                  sideButtonText: 'Sign Up',
                  onSideButtonPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      '/register',
                      (_) => false,
                    );
                  },
                ),
                _buildEmailField(bloc),
                _buildPasswordField(bloc),
                Container(
                  margin: EdgeInsets.only(top: 25.0),
                ),
                _buildSubmitButton(bloc),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailField(AuthBloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'name@example.com',
            labelText: 'Email',
            errorText: snapshot.error,
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              borderSide: BorderSide(color: Colors.blue),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              borderSide: BorderSide(color: Colors.grey),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              borderSide: BorderSide(color: Colors.red),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPasswordField(AuthBloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return Container(
          margin: EdgeInsets.only(top: 8),
          child: TextField(
            onChanged: bloc.changePassword,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
              labelText: 'Password',
              errorText: snapshot.error,
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Colors.blue),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Colors.grey),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Colors.red),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> _buildErrorAlert(
    BuildContext context,
    dynamic error,
    StreamSubscription<FirebaseUser> unsub,
  ) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(
            "It's not possible to login in now. Please, check your credentials",
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('DISMISS'),
              onPressed: () {
                unsub.cancel();
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  Widget _buildSubmitButton(AuthBloc bloc) {
    return StreamBuilder(
      stream: bloc.enableSubmit,
      builder: (context, snapshot) {
        final onSubmit = () {
          StreamSubscription<FirebaseUser> subscription;
          bloc.submit();

          subscription = bloc.user.listen(
            (data) {
              subscription.cancel();
              Navigator.of(context).pushNamedAndRemoveUntil('/', (_) => false);
            },
            onError: (error) => _buildErrorAlert(context, error, subscription),
          );
        };

        return ListTile(
          title: OutlineButton(
            child: Text(
              'Sign in',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            color: Colors.blue,
            textColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            borderSide: BorderSide(color: Colors.blue),
            onPressed: snapshot.hasData ? onSubmit : null,
          ),
        );
      },
    );
  }
}
