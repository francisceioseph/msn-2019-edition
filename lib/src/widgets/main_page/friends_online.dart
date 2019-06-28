import 'package:flutter/material.dart';
import 'package:messanger/src/blocs/online_friends/online_friends_bloc.dart';
import 'package:messanger/src/widgets/main_page/friend_tile.dart';

class FriendsOnline extends StatelessWidget {
  final List<dynamic> friendsOnline;

  FriendsOnline({
    Key key,
    @required this.friendsOnline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OnlineFriendsBloc();
    return ListView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return FriendTile();
      },
    );
  }
}
