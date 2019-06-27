import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class UserImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/placeholder.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
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
          ),
        ],
      ),
    );
  }
}
