import 'package:flutter/material.dart';

class NudgeIconButton extends StatelessWidget {
  final Function onPressed;

  NudgeIconButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        icon: Icon(Icons.vibration),
        tooltip: 'Nudge',
        onPressed: this.onPressed,
      ),
    );
  }
}
