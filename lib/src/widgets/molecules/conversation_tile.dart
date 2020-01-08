import 'package:flutter/material.dart';
import 'package:messanger/src/models/chat_page_arguments.dart';
import 'package:messanger/src/models/user_model.dart';
import 'package:messanger/src/models/conversation_model.dart';
import 'package:messanger/src/widgets/atoms/list_item_subtitle_2.dart';
import 'package:messanger/src/widgets/atoms/list_item_title.dart';
import 'package:messanger/src/widgets/molecules/status_avatar.dart';
import 'package:messanger/src/widgets/pages/chat_page.dart';

class ConversationTile extends StatelessWidget {
  final ConversationModel conversation;

  ConversationTile({
    @required this.conversation,
  });

  @override
  Widget build(BuildContext context) {
    final UserModel attendant = conversation.attendants[1];

    return Container(
      margin: EdgeInsets.only(top: 16),
      child: ListTile(
        onTap: () {
          Navigator.of(context).pushNamed(
            ChatPage.routeName,
            arguments: ChatPageArguments(conversation: conversation),
          );
        },
        leading: StatusAvatar(
          status: attendant.status,
          imageUrl: attendant.imageUrl,
        ),
        title: ListItemTitle(
          text: attendant.name,
        ),
        subtitle: ListItemSubtitle2(
          text: attendant.music,
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
      ),
    );
  }
}
