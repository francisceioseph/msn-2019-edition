import 'package:flutter/material.dart';
import 'package:messanger/src/widgets/atoms/logout_button.dart';
import 'package:messanger/src/widgets/molecules/user/user_descriptor.dart';
import 'package:messanger/src/widgets/molecules/user/user_music.dart';
import 'package:messanger/src/widgets/molecules/user/user_status.dart';

class SettingsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        UserDescriptor(),
        UserStatus(),
        UserMusic(),
        LogoutButton()
      ],
    );
  }
}
