import 'package:flutter/material.dart';
import 'package:messanger/src/constants.dart';
import 'package:messanger/src/models/user.dart';
import 'package:messanger/src/widgets/atoms/list_item_subtitle.dart';
import 'package:messanger/src/widgets/atoms/list_item_subtitle_2.dart';
import 'package:messanger/src/widgets/atoms/list_item_title.dart';
import 'package:messanger/src/widgets/molecules/status_avatar.dart';

class ContactListTile extends StatelessWidget {
  final User user;

  ContactListTile({@required this.user});

  get statusColor => kStatusColorMap[user.status] ?? kStatusColorMap['default'];

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
              color: statusColor,
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
