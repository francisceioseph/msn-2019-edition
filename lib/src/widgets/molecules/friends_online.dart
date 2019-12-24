import 'package:flutter/material.dart';
import 'package:messanger/src/models/user.dart';
import 'package:messanger/src/widgets/atoms/friend_tile.dart';
import 'package:messanger/src/widgets/molecules/missing_data_indicator.dart';

class FriendsOnline extends StatelessWidget {
  final List<Map<String, dynamic>> friendsOnline;

  FriendsOnline({
    Key key,
    @required this.friendsOnline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (friendsOnline.length > 0) {
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

    return MissingDataIndicator(
      icon: Icons.signal_wifi_off,
      message: 'No friends online :(',
    );
  }
}
