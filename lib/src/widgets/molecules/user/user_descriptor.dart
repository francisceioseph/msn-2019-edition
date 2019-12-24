import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:flutter/material.dart';
import 'package:messanger/src/widgets/organisms/current_user_stream_builder.dart';
import 'package:messanger/src/widgets/molecules/user/user_image.dart';
import 'package:messanger/src/widgets/molecules/user/user_actions.dart';
import 'package:messanger/src/widgets/molecules/user/user_info.dart';

class UserDescriptor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CurrentUserStreamBuilder(
        builder: (BuildContext context, firebase.FirebaseUser user) {
          return Column(
            children: <Widget>[
              UserImage(
                user: user,
              ),
              UserInfo(
                user: user,
              ),
              UserActions(),
            ],
          );
        },
      ),
    );
  }
}
