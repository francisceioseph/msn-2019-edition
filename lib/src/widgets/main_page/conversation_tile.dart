import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:messanger/src/models/user.dart';
import 'package:messanger/src/widgets/atoms/list_item_subtitle_2.dart';
import 'package:messanger/src/widgets/atoms/list_item_title.dart';
import 'package:messanger/src/widgets/atoms/loader.dart';
import 'package:messanger/src/widgets/molecules/status_avatar.dart';

class ConversationTile extends StatelessWidget {
  final Map<String, dynamic> conversation;

  ConversationTile({@required this.conversation});

  @override
  Widget build(BuildContext context) {
    final Stream<DocumentSnapshot> otherUser = conversation['attendants'][0];

    return StreamBuilder(
      stream: otherUser,
      builder: (
        BuildContext context,
        AsyncSnapshot<DocumentSnapshot> snap,
      ) {
        if (!snap.hasData) {
          return LoadingIndicator();
        }

        final user = User.fromMap(snap.data.data);

        return ListTile(
          leading: StatusAvatar(
            status: user.status,
          ),
          title: ListItemTitle(
            text: user.name,
          ),
          subtitle: ListItemSubtitle2(
            text: user.music,
          ),
          trailing: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Yesterday',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600],
                ),
              ),
              Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey[300],
                size: 30.0,
              ),
            ],
          ),
        );
      },
    );
  }
}
