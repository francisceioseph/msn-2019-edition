import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:messanger/src/blocs/app_bloc_provider.dart';
import 'package:messanger/src/blocs/online_friends/online_friends_bloc.dart';
import 'package:messanger/src/widgets/main_page/separator.dart';

class FriendsOnlineSeparator extends StatelessWidget {
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
          return Separator(
            text: 'Online',
          );
        }

        final numberOfFriendsOnline = friendsSnapshot.data.length;
        return Separator(
          text: 'Online ($numberOfFriendsOnline)',
        );
      },
    );
  }
}
