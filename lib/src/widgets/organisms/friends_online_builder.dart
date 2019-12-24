import 'package:flutter/material.dart';

import 'package:messanger/src/blocs/app_bloc_provider.dart';
import 'package:messanger/src/blocs/friends_bloc.dart';
import 'package:messanger/src/widgets/molecules/friends_online.dart';
import 'package:messanger/src/widgets/molecules/no_friends_yet_indicator.dart';

class FriendsOnlineBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FriendsBloc friendsBloc = AppBlocProvider.of(context).friendsBloc;

    friendsBloc.fetchOnlineFriends();

    return StreamBuilder(
      stream: friendsBloc.onlineFriends,
      builder: (
        BuildContext context,
        AsyncSnapshot<Map<String, Map<String, dynamic>>> friendsSnapshot,
      ) {
        if (!friendsSnapshot.hasData) {
          return NoFriendsYetIndicator();
        }

        final friendsOnline = friendsSnapshot.data.values.toList();

        return FriendsOnline(
          friendsOnline: friendsOnline,
        );
      },
    );
  }
}
