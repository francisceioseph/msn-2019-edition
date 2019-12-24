import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messanger/src/widgets/atoms/logout_button.dart';
import 'package:messanger/src/widgets/molecules/user/user_descriptor.dart';
import 'package:messanger/src/widgets/molecules/user/user_music.dart';
import 'package:messanger/src/widgets/molecules/user/user_status.dart';
import 'package:messanger/src/widgets/organisms/current_user_stream_builder.dart';
import 'package:messanger/src/widgets/organisms/user_builder.dart';

class SettingsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CurrentUserStreamBuilder(
        builder: (BuildContext context, FirebaseUser user) {
      return UserStreamBuilder(
          userId: user.uid,
          builder: (BuildContext context, Map<String, dynamic> userData) {
            return ListView(
              children: <Widget>[
                UserDescriptor(
                  user: user,
                  userData: userData,
                ),
                UserStatus(
                  user: user,
                  userData: userData,
                ),
                UserMusic(),
                LogoutButton()
              ],
            );
          });
    });
  }
}
