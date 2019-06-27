import 'package:flutter/material.dart';
import 'package:messanger/src/widgets/user_descriptor.dart';

class SettingsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        UserDescriptior(),
      ],
    );
  }
}
