import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:flutter/material.dart';
import 'package:messanger/src/widgets/molecules/user/user_image.dart';
import 'package:messanger/src/widgets/molecules/user/user_info.dart';

class UserDescriptor extends StatelessWidget {
  final firebase.FirebaseUser user;
  final Map<String, dynamic> userData;

  UserDescriptor({
    Key key,
    @required this.user,
    @required this.userData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          UserImage(
            user: user,
          ),
          UserInfo(
            userData: userData,
          ),
        ],
      ),
    );
  }
}
