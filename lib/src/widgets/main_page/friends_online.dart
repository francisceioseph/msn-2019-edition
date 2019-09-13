import 'package:flutter/material.dart';
import 'package:messanger/src/models/user.dart';
import 'package:messanger/src/widgets/main_page/friend_tile.dart';
import 'package:messanger/src/widgets/no_friends_online_yet_indicator.dart';

class FriendsOnline extends StatelessWidget {
  final List<Map<String, dynamic>> friendsOnline;

  FriendsOnline({
    Key key,
    @required this.friendsOnline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (friendsOnline.length > 10) {
      return ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          final friendMap = friendsOnline[index];
          return FriendTile(
            friend: User.fromMap(friendMap),
          );
        },
      );
    }

    return NoFriendsOnlineYetIndicator();
  }
}
