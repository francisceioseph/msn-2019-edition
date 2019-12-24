import 'package:flutter/material.dart';

class ListItemSubtitle extends StatelessWidget {
  final String text;
  final Color color;

  ListItemSubtitle({
    Key key,
    this.text,
    this.color = Colors.blue,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.left,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}
