import 'package:flutter/material.dart';

class ImageIconButton extends StatelessWidget {
  final Function onPressed;

  ImageIconButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        icon: Icon(Icons.camera),
        tooltip: 'Image',
        onPressed: this.onPressed,
      ),
    );
  }
}
