import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messanger/src/blocs/app_bloc_provider.dart';
import 'package:messanger/src/widgets/outline_form_button.dart';
import 'package:messanger/src/widgets/outline_form_text_field.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _passwordConfirmationFocusNode = FocusNode();

  String _displayName;
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
                labelText: 'Name',
                hintText: 'Your full name',
                keyboardType: TextInputType.text,
                validator: _validateNameField,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (v) {
                  _changeFocus(context, _emailFocusNode);
                },
                onFieldSaved: (v) {
                  setState(() => _displayName = v);
                },
              ),
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
                textInputAction: TextInputAction.next,
                focusNode: _passwordFocusNode,
                validator: _validatePasswordField,
                onFieldSubmitted: (v) {
                  _changeFocus(context, _passwordConfirmationFocusNode);
                },
                onFieldSaved: (v) {
                  setState(() {
                    _password = v;
                  });
                },
              ),
              OutlineFormTextField(
                labelText: 'Password Confirmation',
                hintText: 'Your password again :)',
                keyboardType: TextInputType.text,
                obscureText: true,
                textInputAction: TextInputAction.done,
                validator: _validatePasswordConfirmationField,
                focusNode: _passwordConfirmationFocusNode,
                onFieldSaved: (v) {
                  setState(() {
                    _password = v;
                  });
                },
              ),
              OutlineFormButton(
                text: 'Register',
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

  String _validateNameField(String value) {
    if (value.isEmpty) {
      return 'Name is a required field';
    }

    return null;
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

  String _validatePasswordConfirmationField(String value) {
    if (value.isEmpty) {
      return 'Password confirmation is a required field';
    }

    if (value != _password) {
      return 'Password and password confirmation must be equal';
    }

    return null;
  }

  void _onSubmit() {
    if (_formKey.currentState.validate()) {
      final bloc = AppBlocProvider.of(context).authBloc;
      StreamSubscription<FirebaseUser> subscription;

      _formKey.currentState.save();

      bloc.createUser(_displayName, _email, _password);

      subscription = bloc.user.listen(
        (user) {
          subscription.cancel();
          Navigator.of(context).pushNamedAndRemoveUntil('/', (_) => false);
        },
        onError: (error) {
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
            "It's not possible to sign up now. Please, try again later",
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
