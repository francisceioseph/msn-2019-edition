import 'package:flutter/material.dart';

class EmojiIconButton extends StatelessWidget {
  final Function onPressed;

  EmojiIconButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        icon: Icon(Icons.tag_faces),
        tooltip: 'Emoji',
        onPressed: this.onPressed,
      ),
    );
  }
}
