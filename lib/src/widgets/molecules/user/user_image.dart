import 'dart:ui' as ui;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserImage extends StatelessWidget {
  final FirebaseUser user;

  UserImage({
    @required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: Stack(
        children: <Widget>[
          _buildBackgroundImage(),
          _buildUserImage(),
        ],
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/placeholder.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildUserImage() {
    return Center(
      child: ClipRect(
        child: SizedBox(
          child: BackdropFilter(
            filter: ui.ImageFilter.blur(
              sigmaX: 5.0,
              sigmaY: 5.0,
            ),
            child: Center(
              child: Image.asset('assets/images/placeholder.jpg'),
            ),
          ),
        ),
      ),
    );
  }
}
