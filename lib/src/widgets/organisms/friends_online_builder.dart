import 'package:flutter/material.dart';

import 'package:messanger/src/blocs/app_bloc_provider.dart';
import 'package:messanger/src/blocs/friends_bloc.dart';
import 'package:messanger/src/models/user_model.dart';
import 'package:messanger/src/widgets/molecules/friends_online.dart';
import 'package:messanger/src/widgets/molecules/no_friends_yet_indicator.dart';

class FriendsOnlineBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FriendsBloc bloc = AppBlocProvider.of(context).friendsBloc;

    _fetchCachedData(bloc);

    return StreamBuilder(
      stream: bloc.onlineFriends,
      builder: (
        BuildContext context,
        AsyncSnapshot<Map<String, UserModel>> friendsSnapshot,
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

  _fetchCachedData(FriendsBloc bloc) {
    bloc.onlineFriends.take(1).listen((data) {
      if (data.length == 0) {
        bloc.fetchOnlineFriends();
      }
    });
  }
}
