import 'package:flutter/material.dart';
import 'package:messanger/src/blocs/app_bloc_provider.dart';
import 'package:messanger/src/widgets/register/register_form.dart';

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
          right: 16,
          left: 16,
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
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
