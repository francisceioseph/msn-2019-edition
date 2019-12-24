import 'package:flutter/material.dart';
import 'package:messanger/src/widgets/atoms/outline_form_button.dart';
import 'package:messanger/src/widgets/molecules/logo_image.dart';
import 'package:messanger/src/widgets/molecules/welcome_section.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        margin: EdgeInsets.only(
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
                  welcomeText: 'Welcome to your Messenger 2019',
                ),
                Container(
                  margin: EdgeInsets.only(top: 8),
                ),
                OutlineFormButton(
                  text: 'Sign In',
                  onPressed: () => _onSignInPressed(context),
                ),
                OutlineFormButton(
                  text: 'Sign Up',
                  onPressed: () => _onSignUpPressed(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onSignInPressed(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil('/login', (_) => false);
  }

  void _onSignUpPressed(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil('/register', (_) => false);
  }
}
