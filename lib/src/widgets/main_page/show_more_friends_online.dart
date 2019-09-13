import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:messanger/src/blocs/app_bloc_provider.dart';
import 'package:messanger/src/blocs/friends_bloc.dart';

class ShowMoreFriendsOnline extends StatelessWidget {
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
          return Container();
        }

        final numberOfFriendsOnline = friendsSnapshot.data.length;

        if (numberOfFriendsOnline > 10) {
          return Container(
            child: FlatButton(
              child: Text(
                'SHOW MORE',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              onPressed: () {},
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
