import 'package:flutter/material.dart';
import 'package:messanger/src/constants.dart';
import 'package:messanger/src/widgets/list_item_subtitle_2.dart';
import 'package:messanger/src/widgets/list_item_title.dart';
import 'package:messanger/src/widgets/status_avatar.dart';

class CallListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: ListTile(
        leading: StatusAvatar(
          status: kInvisibleStatus,
        ),
        title: ListItemTitle(
          text: 'Some Contact Name',
        ),
        subtitle: ListItemSubtitle2(
          text: 'last call Yesterday',
          color: Colors.grey[600],
        ),
        trailing: Icon(
          Icons.call,
          color: Colors.grey[400],
          size: 24.0,
        ),
      ),
    );
  }
}
