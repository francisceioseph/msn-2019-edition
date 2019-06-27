import 'package:flutter/material.dart';
import 'package:messanger/src/blocs/login/bloc.dart';
import 'package:messanger/src/blocs/login/provider.dart';
import 'package:messanger/src/widgets/main_page/app_bar.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: MainAppBar(),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            emailField(bloc),
            passwordField(bloc),
            Container(
              margin: EdgeInsets.only(top: 25.0),
            ),
            submitButton(bloc),
          ],
        ),
      ),
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'you@example.com',
            labelText: 'Email',
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changePassword,
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Password',
            labelText: 'Password',
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.enableSubmit,
      builder: (context, snapshot) {
        return RaisedButton(
          child: Text(
            'LOGIN',
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.blue,
          onPressed: snapshot.hasData
              ? () {
                  bloc.submit();
                  Navigator.of(context).pushReplacementNamed('/');
                }
              : null,
        );
      },
    );
  }
}
