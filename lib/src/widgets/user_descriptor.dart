import 'package:flutter/material.dart';
import 'package:messanger/src/widgets/user_image.dart';

class UserDescriptior extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          UserImage(),
        ],
      ),
    );
  }
}
