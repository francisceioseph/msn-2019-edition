import 'package:flutter/material.dart';

class MissingDataIndicator extends StatelessWidget {
  final IconData icon;
  final String message;

  MissingDataIndicator({
    Key key,
    @required this.icon,
    @required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            bottom: 24,
          ),
          child: Icon(
            this.icon,
            color: Colors.grey[400],
            size: 80.0,
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          child: Text(
            this.message,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.grey[600],
            ),
          ),
        ),
      ],
    );
  }
}
