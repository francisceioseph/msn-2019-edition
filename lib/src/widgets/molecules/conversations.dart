import 'package:flutter/material.dart';
import 'package:messanger/src/widgets/molecules/conversation_tile.dart';

class Conversations extends StatelessWidget {
  final Map<String, Map<String, dynamic>> conversations;

  Conversations({
    Key key,
    @required this.conversations,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chats = conversations.values.toList();

    return ListView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: chats.length,
      itemBuilder: (BuildContext context, int index) {
        return ConversationTile(
          conversation: chats[index],
        );
      },
    );
  }
}
