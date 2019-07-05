import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:messanger/src/blocs/app_bloc_provider.dart';
import 'package:messanger/src/blocs/online_friends/online_friends_bloc.dart';
import 'package:messanger/src/widgets/loader.dart';
import 'package:messanger/src/widgets/main_page/friend_tile.dart';

class FriendsOnline extends StatelessWidget {
  final List<dynamic> friendsOnline;

  FriendsOnline({
    Key key,
    @required this.friendsOnline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OnlineFriendsBloc onlineFriendsBloc =
        AppBlocProvider.of(context).onlineFriendsBloc;

    // onlineFriendsBloc.friends.listen((data) {
    //   print(data);
    // });

    return StreamBuilder(
      stream: onlineFriendsBloc.friends,
      builder: (
        BuildContext context,
        AsyncSnapshot<QuerySnapshot> friendsSnapshot,
      ) {
        if (!friendsSnapshot.hasData) {
          return LoadingIndicator();
        }

        return ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: friendsSnapshot.data.documents.length,
          itemBuilder: (BuildContext context, int index) {
            final friend = friendsSnapshot.data.documents[index];
            return FriendTile();
          },
        );
      },
    );
  }
}
