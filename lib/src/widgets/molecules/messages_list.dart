import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:messanger/src/models/message_model.dart';

class MessageList extends StatelessWidget {
  final List<MessageModel> messages;
  final String currentUserId;

  MessageList({
    this.messages,
    this.currentUserId,
  });

  @override
  Widget build(BuildContext context) {
    final BubbleStyle bubbleStyleFromOther = BubbleStyle(
      nip: BubbleNip.leftTop,
      color: Colors.blue[700],
      elevation: 1,
      margin: BubbleEdges.only(top: 12.0, right: 50.0),
      alignment: Alignment.topLeft,
    );

    final BubbleStyle bubbleStyleFromMe = BubbleStyle(
      nip: BubbleNip.rightTop,
      color: Color(0xFF383838),
      elevation: 1,
      margin: BubbleEdges.only(top: 12.0, left: 50.0),
      alignment: Alignment.topRight,
    );

    return ListView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: messages.length,
      padding: EdgeInsets.only(
        right: 16,
        left: 16,
      ),
      itemBuilder: (BuildContext context, int index) {
        final message = messages[index];

        return Bubble(
          radius: Radius.circular(18.0),
          padding: BubbleEdges.all(12),
          style: message.from == currentUserId
              ? bubbleStyleFromMe
              : bubbleStyleFromOther,
          child: Text(
            message.content,
            style: TextStyle(
              fontSize: 17,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
