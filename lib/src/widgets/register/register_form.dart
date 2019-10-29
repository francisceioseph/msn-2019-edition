import 'package:flutter/material.dart';
import 'package:messanger/src/widgets/outline_form_text_field.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

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
              ),
              OutlineFormTextField(
                labelText: 'Email',
                hintText: 'Your email address',
                keyboardType: TextInputType.emailAddress,
                validator: _validateEmailField,
              ),
              OutlineFormTextField(
                labelText: 'Password',
                hintText: 'Your password',
                keyboardType: TextInputType.text,
                obscureText: true,
                validator: _validatePasswordField,
              ),
              OutlineFormTextField(
                labelText: 'Password Confirmation',
                hintText: 'Your password again :)',
                keyboardType: TextInputType.text,
                obscureText: true,
                validator: _validatePasswordConfirmationField,
              ),
            ],
          ),
        ),
      ),
    );
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
}
