import 'package:flutter/material.dart';

class LoginAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              right: 8,
            ),
            child: Image.asset(
              'assets/images/msn_logo.png',
              fit: BoxFit.contain,
              height: 28,
            ),
          ),
          Text(
            'Sign In ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
