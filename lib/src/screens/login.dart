import 'package:flutter/material.dart';
import 'package:messanger/src/blocs/login/bloc.dart';
import 'package:messanger/src/blocs/login/provider.dart';
import 'package:messanger/src/widgets/circle_container.dart';
import 'package:messanger/src/widgets/login/app_bar.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = AuthProvider.of(context);

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
                _buildUserImage(),
                _buildWelcomeSection(),
                _buildEmailField(bloc),
                _buildPasswordField(bloc),
                Container(
                  margin: EdgeInsets.only(top: 25.0),
                ),
                _buildSubmitButton(bloc),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUserImage() {
    return Container(
      child: CircleContainer(
        child: CircleAvatar(
          radius: 60,
          backgroundColor: Colors.grey[300],
          child: Container(
            padding: EdgeInsets.all(10),
            child: Image.asset('assets/images/msn_logo.png'),
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeSection() {
    return Container(
      margin: EdgeInsets.only(
        top: 16,
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: <Widget>[
          Text(
            'Sign in with your Windows Live ID. Dont have one?',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
          FlatButton(
            child: Text(
              'Sign up',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildEmailField(AuthBloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'name@example.com',
            labelText: 'Email',
            errorText: snapshot.error,
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              borderSide: BorderSide(color: Colors.blue),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              borderSide: BorderSide(color: Colors.grey),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              borderSide: BorderSide(color: Colors.red),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPasswordField(AuthBloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return Container(
          margin: EdgeInsets.only(top: 8),
          child: TextField(
            onChanged: bloc.changePassword,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
              labelText: 'Password',
              errorText: snapshot.error,
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Colors.blue),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Colors.grey),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Colors.red),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSubmitButton(AuthBloc bloc) {
    return StreamBuilder(
      stream: bloc.enableSubmit,
      builder: (context, snapshot) {
        return SizedBox(
          width: double.infinity,
          child: OutlineButton(
            child: Text(
              'Sign in',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            color: Colors.blue,
            textColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            onPressed: snapshot.hasData
                ? () {
                    bloc.submit();
                    Navigator.of(context).pushReplacementNamed('/');
                  }
                : null,
          ),
        );
      },
    );
  }
}
