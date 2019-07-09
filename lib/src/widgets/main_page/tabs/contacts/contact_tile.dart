import 'package:flutter/material.dart';
import 'package:messanger/src/constants.dart';
import 'package:messanger/src/models/user.dart';
import 'package:messanger/src/widgets/list_item_subtitle.dart';
import 'package:messanger/src/widgets/list_item_subtitle_2.dart';
import 'package:messanger/src/widgets/list_item_title.dart';
import 'package:messanger/src/widgets/status_avatar.dart';

class ContactListTile extends StatelessWidget {
  final User user;

  ContactListTile({@required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: ListTile(
        leading: StatusAvatar(
          status: user.status,
        ),
        title: ListItemTitle(
          text: user.name,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListItemSubtitle(
              text: user.status,
            ),
            ListItemSubtitle2(
              text: user.music,
            )
          ],
        ),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.grey[300],
          size: 30.0,
        ),
      ),
    );
  }
}
