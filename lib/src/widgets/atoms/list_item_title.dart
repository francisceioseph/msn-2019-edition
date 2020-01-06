import 'package:flutter/material.dart';

class ListItemTitle extends StatelessWidget {
  final String text;
  final Color color;

  ListItemTitle({
    Key key,
    this.text,
    this.color,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      textAlign: TextAlign.left,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: color ?? Theme.of(context).textTheme.title.color,
      ),
    );
  }
}
