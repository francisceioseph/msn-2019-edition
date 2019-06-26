import 'package:flutter/material.dart';
import 'package:messanger/src/constants.dart';
import 'package:messanger/src/widgets/list_item_subtitle.dart';
import 'package:messanger/src/widgets/list_item_title.dart';
import 'package:messanger/src/widgets/status_avatar.dart';

class FriendTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: StatusAvatar(
          status: kOnlineStatus,
        ),
        title: ListItemTitle(
          text: 'Some User Name',
        ),
        subtitle: ListItemSubtitle(
          text: 'My music by someone on Spotify',
        ));
  }
}
