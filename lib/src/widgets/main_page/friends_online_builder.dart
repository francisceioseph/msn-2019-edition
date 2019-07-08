import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:messanger/src/blocs/app_bloc_provider.dart';
import 'package:messanger/src/blocs/online_friends/online_friends_bloc.dart';
import 'package:messanger/src/widgets/loader.dart';
import 'package:messanger/src/widgets/main_page/friends_online.dart';

class FriendsOnlineBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    OnlineFriendsBloc onlineFriendsBloc =
        AppBlocProvider.of(context).onlineFriendsBloc;

    return StreamBuilder(
      stream: onlineFriendsBloc.friends,
      builder: (
        BuildContext context,
        AsyncSnapshot<List<DocumentSnapshot>> friendsSnapshot,
      ) {
        if (!friendsSnapshot.hasData) {
          return LoadingIndicator();
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
