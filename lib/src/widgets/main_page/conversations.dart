import 'package:flutter/material.dart';
import 'package:messanger/src/widgets/main_page/conversation_tile.dart';

class Conversations extends StatelessWidget {
  final List<dynamic> conversations;

  Conversations({
    Key key,
    @required this.conversations,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: conversations.length,
      itemBuilder: (BuildContext context, int index) {
        return ConversationTile();
      },
    );
  }
}
