import 'package:flutter/material.dart';
import 'package:messanger/src/widgets/atoms/chat_icon_button.dart';
import 'package:messanger/src/widgets/atoms/nudge_icon_button.dart';

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
            ChatIconButton(
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
            NudgeIconButton(
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
