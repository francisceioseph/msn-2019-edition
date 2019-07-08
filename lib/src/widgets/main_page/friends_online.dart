import 'package:flutter/material.dart';
import 'package:messanger/src/models/user.dart';
import 'package:messanger/src/widgets/main_page/friend_tile.dart';

class FriendsOnline extends StatelessWidget {
  final List<Map<String, dynamic>> friendsOnline;

  FriendsOnline({
    Key key,
    @required this.friendsOnline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: friendsOnline.length,
      itemBuilder: (BuildContext context, int index) {
        final friendMap = friendsOnline[index];
        return FriendTile(
          friend: User.fromMap(friendMap),
        );
      },
    );
  }
}
