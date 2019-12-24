import 'package:flutter/material.dart';
import 'package:messanger/src/widgets/logo_image.dart';
import 'package:messanger/src/widgets/organisms/register_form.dart';
import 'package:messanger/src/widgets/welcome_section.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 16,
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                LogoImage(),
                WelcomeSection(
                  welcomeText:
                      'Let\'s create a Windows Live ID. Do you have one?',
                  sideButtonText: 'Sign in',
                  onSideButtonPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/login',
                      (_) => false,
                    );
                  },
                ),
                RegisterForm(),
                Container(
                  margin: EdgeInsets.only(top: 25.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
