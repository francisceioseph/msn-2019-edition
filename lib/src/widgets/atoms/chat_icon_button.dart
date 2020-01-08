import 'package:flutter/material.dart';

class ChatIconButton extends StatelessWidget {
  final Function onPressed;

  ChatIconButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        icon: Icon(Icons.chat),
        tooltip: 'Chats',
        onPressed: this.onPressed,
      ),
    );
  }
}
