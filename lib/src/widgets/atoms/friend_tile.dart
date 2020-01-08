import 'package:flutter/material.dart';
import 'package:messanger/src/models/user_model.dart';
import 'package:messanger/src/widgets/atoms/list_item_subtitle.dart';
import 'package:messanger/src/widgets/atoms/list_item_title.dart';
import 'package:messanger/src/widgets/molecules/status_avatar.dart';

class FriendTile extends StatelessWidget {
  final UserModel friend;

  FriendTile({@required this.friend});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: StatusAvatar(
        status: friend.status,
        imageUrl: friend.imageUrl,
      ),
      title: ListItemTitle(
        text: friend.name,
      ),
      subtitle: ListItemSubtitle(
        text: friend.music,
      ),
    );
  }
}
