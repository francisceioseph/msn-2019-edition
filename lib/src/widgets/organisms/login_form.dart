import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messanger/src/blocs/app_bloc_provider.dart';
import 'package:messanger/src/widgets/atoms/outline_form_button.dart';
import 'package:messanger/src/widgets/atoms/outline_form_text_field.dart';
import 'package:messanger/src/widgets/templates/loading_dialog.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: 16,
        left: 16,
      ),
      child: Center(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              OutlineFormTextField(
                labelText: 'Email',
                hintText: 'Your email address',
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                focusNode: _emailFocusNode,
                validator: _validateEmailField,
                onFieldSubmitted: (v) {
                  _changeFocus(context, _passwordFocusNode);
                },
                onFieldSaved: (v) {
                  setState(() => _email = v);
                },
              ),
              OutlineFormTextField(
                labelText: 'Password',
                hintText: 'Your password',
                keyboardType: TextInputType.text,
                obscureText: true,
                textInputAction: TextInputAction.done,
                focusNode: _passwordFocusNode,
                validator: _validatePasswordField,
                onFieldSaved: (v) {
                  setState(() {
                    _password = v;
                  });
                },
              ),
              OutlineFormButton(
                text: 'Sign In',
                onPressed: _onSubmit,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _changeFocus(
    BuildContext context,
    FocusNode focusNode,
  ) {
    FocusScope.of(context).requestFocus(focusNode);
  }

  String _validateEmailField(String value) {
    if (value.isEmpty) {
      return 'Email is a required field';
    }
    return null;
  }

  String _validatePasswordField(String value) {
    if (value.isEmpty) {
      return 'Password is a required field';
    }

    setState(() {
      _password = value;
    });

    return null;
  }

  void _onSubmit() {
    if (_formKey.currentState.validate()) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return LoadingDialog();
          });

      final bloc = AppBlocProvider.of(context).authBloc;
      StreamSubscription<FirebaseUser> subscription;

      _formKey.currentState.save();

      bloc.login(_email, _password);

      subscription = bloc.user.listen(
        (user) {
          subscription.cancel();
          Navigator.of(context).pop();
          Navigator.of(context).pushNamedAndRemoveUntil('/', (_) => false);
        },
        onError: (error) {
          Navigator.of(context).pop();
          _buildErrorAlert(context, error, subscription);
        },
      );
    }
  }

  Future<dynamic> _buildErrorAlert(
    BuildContext context,
    dynamic error,
    StreamSubscription<FirebaseUser> subscription,
  ) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(
            "It's not possible to sign in now. Please, try again later",
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('DISMISS'),
              onPressed: () {
                subscription.cancel();
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }
}
