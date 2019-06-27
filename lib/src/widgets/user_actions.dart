import 'package:flutter/material.dart';

class UserActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Theme(
        data: ThemeData(
          iconTheme: IconThemeData(
            color: Colors.blue,
          ),
        ),
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.chat),
              tooltip: 'Chats',
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.call),
              tooltip: 'Call',
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.video_call),
              tooltip: 'Videocall',
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.vibration),
              tooltip: 'Nudge',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
