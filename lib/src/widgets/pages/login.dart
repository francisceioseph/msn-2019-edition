import 'package:flutter/material.dart';
import 'package:messanger/src/widgets/login/app_bar.dart';
import 'package:messanger/src/widgets/login/login_form.dart';
import 'package:messanger/src/widgets/logo_image.dart';
import 'package:messanger/src/widgets/welcome_section.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('/register', (_) => false);
                  },
                ),
                LoginForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
