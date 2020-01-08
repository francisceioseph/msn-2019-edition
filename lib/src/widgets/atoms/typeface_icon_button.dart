import 'package:flutter/material.dart';

class TypefaceIconButton extends StatelessWidget {
  final Function onPressed;

  TypefaceIconButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        icon: Icon(Icons.font_download),
        tooltip: 'Chat Font',
        onPressed: this.onPressed,
      ),
    );
  }
}
