import 'package:flutter/material.dart';
import 'package:messanger/src/widgets/main_page/conversations_builder.dart';
import 'package:messanger/src/widgets/main_page/friends_online_builder.dart';
import 'package:messanger/src/widgets/main_page/friends_online_separator.dart';
import 'package:messanger/src/widgets/main_page/separator.dart';
import 'package:messanger/src/widgets/main_page/show_more_friends_online.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          FriendsOnlineSeparator(),
          FriendsOnlineBuilder(),
          ShowMoreFriendsOnline(),
          Separator(
            text: 'Chats',
          ),
          ConversationsBuilder(),
        ],
      ),
    );
  }
}
