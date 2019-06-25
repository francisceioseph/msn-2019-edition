import 'package:flutter/material.dart';

class ConversationTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey[300],
        child: Text(
          'CC',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey[700],
          ),
        ),
      ),
      title: Text(
        'Some Name',
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        'Some subtitle',
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
      trailing: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Yesterday',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
          ),
          Icon(
            Icons.keyboard_arrow_right,
            color: Colors.grey[300],
            size: 30.0,
          ),
        ],
      ),
    );
  }
}
