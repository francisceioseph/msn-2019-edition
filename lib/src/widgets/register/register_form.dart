import 'package:flutter/material.dart';
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
              ),
              OutlineFormTextField(
                labelText: 'Password Confirmation',
                hintText: 'Your password again :)',
                keyboardType: TextInputType.text,
                obscureText: true,
                textInputAction: TextInputAction.done,
                validator: _validatePasswordConfirmationField,
                focusNode: _passwordConfirmationFocusNode,
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
    return null;
  }

  String _validatePasswordConfirmationField(String value) {
    if (value.isEmpty) {
      return 'Password confirmation is a required field';
    }
    return null;
  }

  void _onSubmit() {
    if (_formKey.currentState.validate()) {
      Scaffold.of(this.context).showSnackBar(
        SnackBar(content: Text('Processig data...')),
      );
    }
  }
}
