import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:messanger/src/blocs/app_bloc_provider.dart';
import 'package:messanger/src/blocs/friends_bloc.dart';
import 'package:messanger/src/widgets/molecules/friends_online.dart';
import 'package:messanger/src/widgets/molecules/no_friends_yet_indicator.dart';

class FriendsOnlineBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FriendsBloc onlineFriendsBloc = AppBlocProvider.of(context).friendsBloc;

    return StreamBuilder(
      stream: onlineFriendsBloc.onlineFriends,
      builder: (
        BuildContext context,
        AsyncSnapshot<List<DocumentSnapshot>> friendsSnapshot,
      ) {
        if (!friendsSnapshot.hasData) {
          return NoFriendsYetIndicator();
        }

        final friendsOnline =
            friendsSnapshot.data.map((document) => document.data).toList();

        return FriendsOnline(
          friendsOnline: friendsOnline,
        );
      },
    );
  }
}
