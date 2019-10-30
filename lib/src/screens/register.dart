import 'package:flutter/material.dart';
import 'package:messanger/src/blocs/app_bloc_provider.dart';
import 'package:messanger/src/widgets/register/register_form.dart';
import 'package:messanger/src/widgets/user_image.dart';
import 'package:messanger/src/widgets/welcome_section.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = AppBlocProvider.of(context).authBloc;

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
                UserImage(),
                WelcomeSection(
                  welcomeText: 'Let\'s create a Windows Live ID. Do you have one?',
                  sideButtonText: 'Sign in',
                  onSideButtonPressed: () {},
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
