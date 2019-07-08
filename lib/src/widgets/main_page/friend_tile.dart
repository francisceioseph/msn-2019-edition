import 'package:flutter/material.dart';
import 'package:messanger/src/models/user.dart';
import 'package:messanger/src/widgets/list_item_subtitle.dart';
import 'package:messanger/src/widgets/list_item_title.dart';
import 'package:messanger/src/widgets/status_avatar.dart';

class FriendTile extends StatelessWidget {
  final User friend;

  FriendTile({@required this.friend});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: StatusAvatar(
          status: friend.status,
        ),
        title: ListItemTitle(
          text: friend.name,
        ),
        subtitle: ListItemSubtitle(
          text: friend.music,
        ));
  }
}
