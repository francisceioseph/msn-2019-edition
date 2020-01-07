import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:messanger/src/models/call_model.dart';
import 'package:messanger/src/widgets/atoms/list_item_subtitle_2.dart';
import 'package:messanger/src/widgets/atoms/list_item_title.dart';
import 'package:messanger/src/widgets/molecules/status_avatar.dart';

class CallListTile extends StatelessWidget {
  final CallModel call;

  CallListTile({@required this.call});

  @override
  Widget build(BuildContext context) {
    final attendant = call.attendants[1];

    return Container(
      margin: EdgeInsets.only(top: 16),
      child: ListTile(
        leading: StatusAvatar(
          status: attendant.status,
        ),
        title: ListItemTitle(
          text: attendant.name,
        ),
        subtitle: ListItemSubtitle2(
          text: 'last call at ${call.endedAt.yMMMMdjm}',
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
