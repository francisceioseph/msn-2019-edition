import 'package:flutter/material.dart';
import 'package:messanger/src/widgets/molecules/logo_image.dart';
import 'package:messanger/src/widgets/molecules/login_app_bar.dart';
import 'package:messanger/src/widgets/molecules/welcome_section.dart';
import 'package:messanger/src/widgets/organisms/login_form.dart';

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
