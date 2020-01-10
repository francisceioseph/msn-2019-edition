import 'package:flutter/material.dart';

class SendIconButton extends StatelessWidget {
  final Function onPressed;

  SendIconButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        icon: Icon(Icons.send),
        tooltip: 'send icon',
        onPressed: this.onPressed,
        color: Theme.of(context).buttonColor,
      ),
    );
  }
}
