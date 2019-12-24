import 'package:flutter/material.dart';

class Separator extends StatelessWidget {
  final String text;

  Separator({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16, left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            text,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            child: Divider(
              color: Colors.grey[300],
              height: 1,
            ),
          )
        ],
      ),
    );
  }
}
