import 'package:flutter/material.dart';

class NoFriendsYetIndicator extends StatelessWidget {
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
            Icons.nature_people,
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
            'You don\'nt have any friend yet! Add some contacts and start chatting!',
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
