import 'package:flutter/material.dart';

class NoFriendsOnlineYetIndicator extends StatelessWidget {
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
            Icons.signal_wifi_off,
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
            'Nobody is online yet :(',
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
