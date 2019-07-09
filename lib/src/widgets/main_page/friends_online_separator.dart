import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:messanger/src/blocs/app_bloc_provider.dart';
import 'package:messanger/src/blocs/friends_bloc.dart';
import 'package:messanger/src/widgets/main_page/separator.dart';

class FriendsOnlineSeparator extends StatelessWidget {
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
