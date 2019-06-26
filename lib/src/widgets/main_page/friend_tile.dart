import 'package:flutter/material.dart';
import 'package:messanger/src/widgets/circle_container.dart';

class FriendTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleContainer(
        child: CircleAvatar(
          backgroundColor: Colors.grey[300],
          child: Text(
            'CC',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
        ),
        borderColor: Colors.green,
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
    );
  }
}
