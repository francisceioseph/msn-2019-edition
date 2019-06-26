import 'package:flutter/material.dart';
import 'package:messanger/src/constants.dart';
import 'package:messanger/src/widgets/status_avatar.dart';

class FriendTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: StatusAvatar(
        status: kOnlineStatus,
      ),
      title: Text(
        'Some Name',
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        'Some subtitle',
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }
}
