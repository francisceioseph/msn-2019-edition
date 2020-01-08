import 'package:flutter/material.dart';

class CallIconButton extends StatelessWidget {
  final Function onPressed;

  CallIconButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        icon: Icon(Icons.call),
        tooltip: 'Image',
        onPressed: this.onPressed,
      ),
    );
  }
}
