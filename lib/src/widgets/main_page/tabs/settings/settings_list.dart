import 'package:flutter/material.dart';
import 'package:messanger/src/widgets/main_page/logout_button.dart';
import 'package:messanger/src/widgets/user/user_descriptor.dart';
import 'package:messanger/src/widgets/user/user_music.dart';
import 'package:messanger/src/widgets/user/user_status.dart';

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
