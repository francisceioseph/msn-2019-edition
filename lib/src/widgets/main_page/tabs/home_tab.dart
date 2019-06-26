import 'package:flutter/material.dart';
import 'package:messanger/src/widgets/main_page/conversations.dart';
import 'package:messanger/src/widgets/main_page/friends_online.dart';
import 'package:messanger/src/widgets/main_page/separator.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Separator(
            text: 'Online (10)',
          ),
          FriendsOnline(
            friendsOnline: [1, 2, 3, 4, 5, 6, 7, 8, 9, 0],
          ),
          Container(
            child: FlatButton(
              child: Text(
                'SHOW MORE',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              onPressed: () {},
            ),
          ),
          Separator(
            text: 'Chats',
          ),
          Conversations(
            conversations: [1, 2, 3, 4, 5, 6, 7, 8, 9, 0],
          ),
        ],
      ),
    );
  }
}
