import 'package:flutter/material.dart';
import 'package:messanger/src/models/conversation_model.dart';
import 'package:messanger/src/widgets/atoms/call_icon_button.dart';
import 'package:messanger/src/widgets/atoms/emoji_icon_button.dart';
import 'package:messanger/src/widgets/atoms/image_icon_button.dart';
import 'package:messanger/src/widgets/atoms/nudge_icon_button.dart';
import 'package:messanger/src/widgets/atoms/typeface_icon_button.dart';
import 'package:messanger/src/widgets/molecules/chat_app_bar.dart';
import 'package:messanger/src/widgets/molecules/messages_list.dart';

class ChatPage extends StatelessWidget {
  static const String routeName = '/chat';
  final ConversationModel conversation;

  ChatPage({this.conversation});

  @override
  Widget build(BuildContext context) {
    final other = conversation.attendants.last;

    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).primaryIconTheme,
        title: ChatAppBar(
          user: other,
        ),
      ),
      body: Container(
        child: MessageList(
          messages: conversation.messages,
          currentUserId: conversation.attendants[0].id,
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          NudgeIconButton(),
          EmojiIconButton(),
          ImageIconButton(),
          CallIconButton(),
          TypefaceIconButton(),
        ],
      ),
    );
  }
}
