import 'package:flutter/material.dart';

class ListItemSubtitle2 extends StatelessWidget {
  final String text;
  final Color color;

  ListItemSubtitle2({
    Key key,
    this.text,
    this.color = Colors.blue,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.left,
      style: Theme.of(context).primaryTextTheme.subtitle,
    );
  }
}
