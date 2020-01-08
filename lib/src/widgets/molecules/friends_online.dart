import 'package:flutter/material.dart';
import 'package:messanger/src/models/user_model.dart';
import 'package:messanger/src/widgets/atoms/friend_tile.dart';
import 'package:messanger/src/widgets/molecules/missing_data_indicator.dart';

class FriendsOnline extends StatelessWidget {
  final List<UserModel> friendsOnline;

  FriendsOnline({
    Key key,
    @required this.friendsOnline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (friendsOnline.length > 0) {
      return Expanded(
        flex: 1,
        child: ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: friendsOnline.length,
          itemBuilder: (BuildContext context, int index) {
            return FriendTile(
              friend: friendsOnline[index],
            );
          },
        ),
      );
    }

    return MissingDataIndicator(
      icon: Icons.signal_wifi_off,
      message: 'No friends online :(',
    );
  }
}
